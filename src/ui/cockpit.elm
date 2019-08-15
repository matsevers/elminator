module Ui.Cockpit exposing (element)

import Html exposing (..)
import Html.Attributes exposing (..)
import Objects.Manager exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Ui.Speedometer exposing (..)


element : Model -> Html Types.Msg
element model =
    div
        [ Html.Attributes.style "background-color" "rgb(32, 32, 32)"
        , Html.Attributes.style "padding" "40px 0px 40px 0px"
        , Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex" "1"
        , Html.Attributes.style "flex-direction" "row"
        , Html.Attributes.style "align-items" "stretch"
        ]
        [ div
            [ Html.Attributes.style "flex" "1", Html.Attributes.style "display" "flex", Html.Attributes.style "justify-content" "center", Html.Attributes.style "border-right" "2px solid #3f3d3d" ]
            [ Ui.Speedometer.element (round model.myPlayer.controlledObject.motion.speed) 0 (round model.myPlayer.controlledObject.motion.maxForwardSpeed) ]
        , div
            [ Html.Attributes.style "flex" "1", Html.Attributes.style "display" "flex", Html.Attributes.style "border-right" "2px solid #3f3d3d", Html.Attributes.style "justify-content" "center" ]
            [ Html.img [ src "assets/logo.png", Html.Attributes.style "width" "261px", Html.Attributes.style "height" "51px" ] [] ]
        , Svg.svg
            [ Html.Attributes.style "flex" "1"
            , Html.Attributes.style "display" "flex"
            , Html.Attributes.style "justify-content" "center"
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
            (Objects.Manager.render (model.map.gameObjects.roads ++ [ model.myPlayer.controlledObject ]))
        ]
