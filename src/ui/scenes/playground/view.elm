module Ui.Scenes.Playground.View exposing (view)

import Html
import Html.Attributes exposing (..)
import Map.Generator exposing (..)
import Objects.Module exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Ui.Scenes.Playground.Cockpit exposing (..)
import Ui.Scenes.Playground.TrafficLight exposing (..)
import Ui.Scenes.Style


widthSvg =
    1000


heightSvg =
    500


minimapMode =
    False


showLabel =
    False


view : Model -> Html.Html Msg
view model =
    Html.div
        Ui.Scenes.Style.globalContainer
        [ Html.div
            [ Html.Attributes.style "display" "flex"
            , Html.Attributes.style "flex" "1"
            , Html.Attributes.style "flex-direction" "row"
            , Html.Attributes.style "align-items" "center"
            , Html.Attributes.style "justify-content" "center"
            ]
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


playground : Model -> Html.Html Msg
playground model =
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
                        ++ List.map
                            (\x -> x.controlledObject)
                            model.onlinePlayers
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
