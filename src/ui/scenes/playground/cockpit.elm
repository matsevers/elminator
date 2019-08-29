module Ui.Scenes.Playground.Cockpit exposing (element)

import Html
import Html.Attributes
import Objects.Module
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
                }
                model.myPlayer.controlledObject.motion

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

        speedometer : Html.Html Types.Msg
        speedometer =
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
                ]

        miniMap : Html.Html Types.Msg
        miniMap =
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
                    (model.map.gameObjects.roads
                        ++ [ model.myPlayer.controlledObject ]
                        ++ List.map (\x -> x.controlledObject)
                            model.onlinePlayers
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
