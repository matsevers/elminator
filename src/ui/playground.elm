module Ui.Playground exposing (element)

import Html exposing (..)
import Html.Attributes exposing (..)
import Map.Generator exposing (..)
import Objects.Manager exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)
import Ui.Cockpit exposing (..)


element : Model -> Html Msg
element model =
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
                , Html.Attributes.style "border" "10px solid rgb(32,32,32)"
                , Html.Attributes.style "border-radius" "20px"
                , Html.Attributes.style "background-color" "rgb(32,32,32)"
                ]
                [ playground model
                , Ui.Cockpit.element model
                ]
            , div
                []
                []
            ]
        ]


playground : Model -> Html Msg
playground model =
    case model.myPlayer.controlledObject.position of
        Position p ->
            Svg.svg
                [ Svg.Attributes.width (String.fromInt (model.map.dimension.tileSize * model.map.dimension.width))
                , Svg.Attributes.height (String.fromInt (model.map.dimension.tileSize * model.map.dimension.height))
                , Html.Attributes.style "background" "#000"
                , Html.Attributes.style "border-radius" "10px"
                , Svg.Attributes.viewBox
                    (String.fromInt
                        (p.x
                            - round
                                (toFloat model.map.dimension.tileSize
                                    * toFloat model.map.dimension.width
                                    / 2
                                    / model.map.dimension.viewScale
                                )
                        )
                        ++ " "
                        ++ String.fromInt
                            (p.y
                                - round
                                    (toFloat model.map.dimension.tileSize
                                        * toFloat model.map.dimension.height
                                        / 2
                                        / model.map.dimension.viewScale
                                    )
                            )
                        ++ " "
                        ++ String.fromInt
                            (round
                                (toFloat model.map.dimension.tileSize
                                    * toFloat model.map.dimension.width
                                    / model.map.dimension.viewScale
                                )
                            )
                        ++ " "
                        ++ String.fromInt
                            (round
                                (toFloat model.map.dimension.tileSize
                                    * toFloat model.map.dimension.height
                                    / model.map.dimension.viewScale
                                )
                            )
                    )
                ]
                (Objects.Manager.render (Map.Generator.map model.map ++ [ model.myPlayer.controlledObject ]))

        _ ->
            div [] []
