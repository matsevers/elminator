module Ui.Scenes.Playground.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Map.Generator exposing (..)
import Objects.Manager exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Ui.Scenes.Playground.Cockpit exposing (..)
import Ui.Scenes.Playground.TrafficLight exposing (..)


widthSvg =
    1000


heightSvg =
    500


minimapMode =
    False


showLabel =
    False


view : Model -> Html Msg
view model =
    div
        [ Html.Attributes.style "height" "100vh"
        , Html.Attributes.style "background-color" "#141617"
        , Html.Attributes.style "background-image" "url('assets/backgroundMenu.svg')"
        ]
        [ div
            [ Html.Attributes.style "display" "flex"
            , Html.Attributes.style "flex" "1"
            , Html.Attributes.style "flex-direction" "row"
            , Html.Attributes.style "align-items" "center"
            , Html.Attributes.style "justify-content" "center"
            ]
            [ div []
                []
            , div
                [ Html.Attributes.style "display" "flex"
                , Html.Attributes.style "flex-direction" "column"
                , Html.Attributes.style "border" "10px solid #0b0c0c"
                , Html.Attributes.style "border-radius" "20px"
                , Html.Attributes.style "background-color" "#0b0c0c"
                ]
                [ playground model
                , Ui.Scenes.Playground.Cockpit.element model
                ]
            , div
                []
                []
            ]
        ]


playground : Model -> Html Msg
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
                        ++ String.fromInt (round (widthSvg / model.map.dimension.viewScale))
                        ++ " "
                        ++ String.fromInt (round (heightSvg / model.map.dimension.viewScale))
                    )
                ]
                (Objects.Manager.render (Map.Generator.map model.map ++ model.myPlayer.catchedCheckpoints ++ [ model.myPlayer.controlledObject ]) model.myPlayer minimapMode model.debug showLabel
                    ++ Ui.Scenes.Playground.TrafficLight.element model (widthSvg // 2 - 100) 0
                )

        Maybe.Nothing ->
            div [] []
