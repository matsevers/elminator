module Ui.Scenes.Playground.Cockpit exposing (element)

import Html exposing (..)
import Html.Attributes exposing (..)
import Objects.Manager exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Ui.Scenes.Playground.Speedometer exposing (..)
import Ui.Scenes.Playground.TrafficLight exposing (..)


minimapMode =
    True


showCollider =
    False


showLabels =
    True


element : Model -> Html Types.Msg
element model =
    let
        motion =
            Maybe.withDefault { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 } model.myPlayer.controlledObject.motion

        infoRowStyle : List (Html.Attribute msg)
        infoRowStyle =
            [ Html.Attributes.style "color" "#fff"
            , Html.Attributes.style "font-family" "Arial"
            , Html.Attributes.style "display" "flex"
            , Html.Attributes.style "align-items" "stretch"
            , Html.Attributes.style "justify-content" "space-between"
            , Html.Attributes.style "background" "#28282b"
            , Html.Attributes.style "margin-top" "20px"
            , Html.Attributes.style "margin-left" "45px"
            , Html.Attributes.style "margin-right" "45px"
            , Html.Attributes.style "overflow" "hidden"
            ]

        lapInfo : Html msg
        lapInfo =
            div
                infoRowStyle
                [ div
                    [ Html.Attributes.style "background-color" "#530DD4"
                    , Html.Attributes.style "transform" "skewX(30deg)"
                    , Html.Attributes.style "margin-left" "-30px"
                    , Html.Attributes.style "padding" "5px 20px 5px 50px"
                    ]
                    [ div [ Html.Attributes.style "transform" "skewX(-30deg)" ]
                        [ Html.text "Labs" ]
                    ]
                , div
                    [ Html.Attributes.style "align-self" "center"
                    , Html.Attributes.style "padding-right" "10px"
                    ]
                    [ Html.text (String.fromInt model.myPlayer.currentLab ++ " | " ++ String.fromInt model.map.options.labs) ]
                ]

        placement : String -> String -> Html msg
        placement place playerName =
            div
                infoRowStyle
                [ div
                    [ Html.Attributes.style "background-color" "#530DD4"
                    , Html.Attributes.style "transform" "skewX(30deg)"
                    , Html.Attributes.style "margin-left" "-30px"
                    , Html.Attributes.style "padding" "5px 20px 5px 50px"
                    ]
                    [ div [ Html.Attributes.style "transform" "skewX(-30deg)" ]
                        [ Html.text place ]
                    ]
                , div
                    [ Html.Attributes.style "align-self" "center"
                    , Html.Attributes.style "padding-right" "10px"
                    ]
                    [ Html.text playerName ]
                ]
    in
    div
        [ Html.Attributes.style "background-color" "#0b0c0c"
        , Html.Attributes.style "padding" "40px 0px 40px 0px"
        , Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex" "1"
        , Html.Attributes.style "flex-direction" "row"
        , Html.Attributes.style "align-items" "stretch"
        ]
        [ div
            [ Html.Attributes.style "flex" "1", Html.Attributes.style "display" "flex", Html.Attributes.style "justify-content" "center", Html.Attributes.style "border-right" "2px solid #3f3d3d" ]
            [ Ui.Scenes.Playground.Speedometer.element (round motion.speed) 0 (round motion.maxForwardSpeed) ]
        , div
            [ Html.Attributes.style "flex" "1"
            , Html.Attributes.style "display" "flex"
            , Html.Attributes.style "flex-direction" "column"
            , Html.Attributes.style "border-right" "2px solid #3f3d3d"
            , Html.Attributes.style "justify-content" "flex-start"
            , Html.Attributes.style "align-items" "stretch"
            ]
            [ Html.img
                [ src "assets/logo.png"
                , Html.Attributes.style "width" "261px"
                , Html.Attributes.style "height" "51px"
                , Html.Attributes.style "align-self" "center"
                ]
                []
            , placement "1" model.myPlayer.label.text
            , lapInfo
            ]
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
            (Objects.Manager.render (model.map.gameObjects.roads ++ [ model.myPlayer.controlledObject ]) model.myPlayer minimapMode showCollider showLabels)
        ]
