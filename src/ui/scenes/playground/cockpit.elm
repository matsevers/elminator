module Ui.Scenes.Playground.Cockpit exposing (element)

import Html
import Html.Attributes
import Html.Events
import Objects.Module
import String
import Svg
import Svg.Attributes
import Types
import Ui.Scenes.Playground.Speedometer
import Ui.Scenes.Playground.Style
import Ui.Scenes.Playground.TrafficLight


minimapMode =
    True


showCollider =
    False


showLabels =
    True


element : Types.Model -> Html.Html Types.Msg
element model =
    let
        motion : Types.Motion
        motion =
            Maybe.withDefault
                { speed = 0
                , maxForwardSpeed = 0
                , maxBackwardSpeed = 0
                , steeringAngle = 0
                }
                model.myPlayer.controlledObject.motion

        getDriveTimeSeconds : Int
        getDriveTimeSeconds =
            if model.myPlayer.time == 0 then
                0

            else
                model.myPlayer.time // 1000

        getDriveTimeMilliSeconds : String
        getDriveTimeMilliSeconds =
            if model.myPlayer.time == 0 then
                "0"

            else
                let
                    ms =
                        String.fromInt
                            (round
                                (toFloat
                                    (model.myPlayer.time
                                        - (getDriveTimeSeconds * 1000)
                                    )
                                    / 10
                                )
                            )
                in
                if String.length ms == 1 then
                    "0" ++ ms

                else
                    ms

        lapInfo : Html.Html msg
        lapInfo =
            Html.div
                Ui.Scenes.Playground.Style.infoRow
                [ Html.div
                    Ui.Scenes.Playground.Style.infoRowSkew
                    [ Html.div
                        Ui.Scenes.Playground.Style.infoRowAntiSkewText
                        [ Html.text "Labs" ]
                    ]
                , Html.div
                    [ Html.Attributes.style "align-self" "center"
                    , Html.Attributes.style "padding-right" "10px"
                    ]
                    [ Html.text
                        (String.fromInt model.myPlayer.currentLab
                            ++ " | "
                            ++ String.fromInt model.map.options.labs
                        )
                    ]
                ]

        timeInfo : Html.Html msg
        timeInfo =
            Html.div
                Ui.Scenes.Playground.Style.infoRow
                [ Html.div
                    Ui.Scenes.Playground.Style.infoRowSkew
                    [ Html.div
                        Ui.Scenes.Playground.Style.infoRowAntiSkewText
                        [ Html.text "Time" ]
                    ]
                , Html.div
                    [ Html.Attributes.style "align-self" "center"
                    , Html.Attributes.style "padding-right" "10px"
                    ]
                    [ Html.text
                        (String.fromInt
                            getDriveTimeSeconds
                            ++ ":"
                            ++ getDriveTimeMilliSeconds
                        )
                    ]
                ]

        speedometer : Html.Html Types.Msg
        speedometer =
            let
                boolToString : Bool -> String
                boolToString b =
                    if b then
                        "true"

                    else
                        "false"
            in
            Html.div
                (Ui.Scenes.Playground.Style.flex1
                    ++ [ Html.Attributes.style "justify-content" "center"
                       , Html.Attributes.style "border-right" "2px solid #3f3d3d"
                       ]
                )
                [ Ui.Scenes.Playground.Speedometer.element
                    (round motion.speed)
                    0
                    (round motion.maxForwardSpeed)
                , Html.input
                    [ Html.Attributes.type_ "checkbox"
                    , Html.Attributes.value (boolToString model.debug)
                    , Html.Events.onInput
                        (\x ->
                            Types.Playground
                                (Types.ChangeColliderVisibility model)
                        )
                    ]
                    []
                ]

        gameInfo : Html.Html Types.Msg
        gameInfo =
            Html.div
                (Ui.Scenes.Playground.Style.flex1
                    ++ [ Html.Attributes.style "flex-direction" "column"
                       , Html.Attributes.style "border-right" "2px solid #3f3d3d"
                       , Html.Attributes.style "justify-content" "flex-start"
                       , Html.Attributes.style "align-items" "stretch"
                       ]
                )
                [ Html.img
                    [ Html.Attributes.src "assets/logo.png"
                    , Html.Attributes.style "width" "261px"
                    , Html.Attributes.style "height" "51px"
                    , Html.Attributes.style "align-self" "center"
                    ]
                    []
                , placement "1" model.myPlayer.label.text
                , lapInfo
                , timeInfo
                ]

        miniMap : Html.Html Types.Msg
        miniMap =
            let
                currentLobby : Types.Lobby
                currentLobby =
                    Maybe.withDefault
                        { identifier = "none"
                        , map = "none"
                        , maxPlayer = 0
                        , onlinePlayers = []
                        , ttl = 0
                        }
                        (List.head <|
                            List.filter
                                (\x ->
                                    x.identifier == model.network.session
                                )
                                -- concat ownLobby with lobbyPool
                                (model.ownLobby
                                    :: model.network.lobbyPool
                                )
                        )
            in
            Svg.svg
                (Ui.Scenes.Playground.Style.flex1
                    ++ [ Html.Attributes.style "justify-content" "center"
                       , Svg.Attributes.viewBox
                            ("0 0 "
                                ++ String.fromInt
                                    (model.map.dimension.tileSize
                                        * model.map.dimension.width
                                    )
                                ++ " "
                                ++ String.fromInt
                                    (model.map.dimension.tileSize
                                        * model.map.dimension.height
                                    )
                            )
                       ]
                )
                (Objects.Module.render.playground
                    -- render roads
                    (model.map.gameObjects.roads
                        -- render own players gameObject
                        ++ [ model.myPlayer.controlledObject ]
                        -- render multiplayer gameObject
                        ++ (List.map (\x -> x.controlledObject) <|
                                -- filter lobby member
                                List.filter
                                    (\player ->
                                        List.member
                                            player.identifier
                                            currentLobby.onlinePlayers
                                    )
                                    model.onlinePlayers
                           )
                    )
                    model.myPlayer
                    minimapMode
                    showCollider
                    showLabels
                )

        placement : String -> String -> Html.Html msg
        placement place playerName =
            Html.div
                Ui.Scenes.Playground.Style.infoRow
                [ Html.div
                    Ui.Scenes.Playground.Style.infoRowSkew
                    [ Html.div Ui.Scenes.Playground.Style.infoRowAntiSkewText
                        [ Html.text place ]
                    ]
                , Html.div
                    [ Html.Attributes.style "align-self" "center"
                    , Html.Attributes.style "padding-right" "10px"
                    ]
                    [ Html.text playerName ]
                ]
    in
    Html.div
        Ui.Scenes.Playground.Style.cockpitContainer
        [ speedometer
        , gameInfo
        , miniMap
        ]
