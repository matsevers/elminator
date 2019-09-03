module Ui.Scenes.Playground.View exposing (view)

import Html
import Html.Attributes
import Map.Generator
import Objects.Module
import Svg
import Svg.Attributes
import Types
import Ui.Scenes.Playground.Cockpit
import Ui.Scenes.Playground.Style
import Ui.Scenes.Playground.TrafficLight
import Ui.Scenes.Style


widthSvg =
    1000


heightSvg =
    500


minimapMode =
    False


showLabel =
    False


view : Types.Model -> Html.Html Types.Msg
view model =
    Html.div
        Ui.Scenes.Style.globalContainer
        [ Html.div
            (Ui.Scenes.Playground.Style.flex1
                ++ [ Html.Attributes.style "align-items" "center"
                   , Html.Attributes.style "justify-content" "center"
                   ]
            )
            [ Html.div []
                []
            , Html.div
                [ Html.Attributes.style "display" "flex"
                , Html.Attributes.style "flex-direction" "column"
                , Html.Attributes.style "border" "10px solid #0b0c0c"
                , Html.Attributes.style "border-radius" "20px"
                , Html.Attributes.style "background-color" "#0b0c0c"
                ]
                [ playground model
                , Ui.Scenes.Playground.Cockpit.element model
                ]
            , Html.div
                []
                []
            ]
        ]


playground : Types.Model -> Html.Html Types.Msg
playground model =
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
    case model.myPlayer.controlledObject.position of
        Just p ->
            Svg.svg
                [ Svg.Attributes.width (String.fromInt widthSvg ++ "px")
                , Svg.Attributes.height (String.fromInt heightSvg ++ "px")
                , Html.Attributes.style "background" "#000"
                , Html.Attributes.style "border-radius" "10px"
                , Svg.Attributes.viewBox
                    (String.fromInt
                        (p.x
                            - round
                                (toFloat widthSvg
                                    / 2
                                    / model.map.dimension.viewScale
                                )
                        )
                        ++ " "
                        ++ String.fromInt
                            (p.y
                                - round
                                    (toFloat heightSvg
                                        / 2
                                        / model.map.dimension.viewScale
                                    )
                            )
                        ++ " "
                        ++ String.fromInt
                            (round (widthSvg / model.map.dimension.viewScale))
                        ++ " "
                        ++ String.fromInt
                            (round (heightSvg / model.map.dimension.viewScale))
                    )
                ]
                (Objects.Module.render.playground
                    (Map.Generator.map model.map
                        ++ model.myPlayer.catchedCheckpoints
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
                        ++ [ model.myPlayer.controlledObject ]
                    )
                    model.myPlayer
                    minimapMode
                    model.debug
                    showLabel
                    ++ Ui.Scenes.Playground.TrafficLight.element
                        model
                        (widthSvg // 2 - 100)
                        0
                )

        Maybe.Nothing ->
            Html.div [] []
