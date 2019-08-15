module Ui.Scenes.MainMenu.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)


view : model -> Html Msg
view model =
    div
        [ Html.Attributes.style "height" "100vh"
        , Html.Attributes.style "background-color" "#141617"
        , Html.Attributes.style "background-image" "url('assets/backgroundMenu.svg')"
        , Html.Attributes.style "display" "flex"
        , Html.Attributes.style "justify-content" "flex-start"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "flex-direction" "column"
        ]
        [ Html.img [ src "assets/logo.png", Html.Attributes.style "width" "70vh", Html.Attributes.style "height" "auto" ]
            []
        , button
            [ Html.Attributes.style "padding" "20px"
            , Html.Attributes.style "background-color" "#f21d9c"
            , Html.Attributes.style "color" "#ffffff"
            , Html.Attributes.style "border-width" "0px"
            , Html.Attributes.style "transform" "perspective(400px) rotateY(-25deg) rotateX(5deg)"
            , Html.Attributes.style "font-size" "20px"
            , onClick
                (ChangeScene
                    Running
                )
            ]
            [ text "Start the engines" ]
        ]
