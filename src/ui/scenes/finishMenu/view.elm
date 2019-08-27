module Ui.Scenes.FinishMenu.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)
import Ui.Scenes.FinishMenu.Update exposing (..)


view : Model -> Html Msg
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
        [ Html.img [ src "assets/logo.png", Html.Attributes.style "width" "70vh", Html.Attributes.style "height" "auto" ] []
        , div
            [ style "display" "flex"
            , style "flex-direction" "row"
            , style "width" "100%"
            , style "justify-content" "center"
            ]
            [ div
                [ style "display" "flex"
                , style "flex-basis" "20%"
                , style "flex-grow" "0"
                , style "align-items" "center"
                , style "flex-direction" "column"
                , style "color" "#fff"
                , style "font-size" "25px"
                , style "font-family" "Arial"
                , style "padding" "20px"
                , style "background-color" "#763fdd"
                , Html.Attributes.style "transform" "perspective(400px) rotateY(15deg) rotateX(5deg)"
                , style "margin" "20px"
                ]
                [ text "YOUR TIME"
                , div [ style "margin-top" "20px" ] []
                ]
            , div
                [ style "flex-basis" "20%"
                , style "flex-grow" "0"
                , style "display" "flex"
                , style "align-items" "center"
                , style "flex-direction" "column"
                , style "color" "#fff"
                , style "font-size" "25px"
                , style "font-family" "Arial"
                , style "padding" "20px"
                , style "background-color" "#E664DD"
                , Html.Attributes.style "transform" "perspective(400px) rotateY(-15deg) rotateX(5deg)"
                , style "margin" "20px"
                ]
                [ text "COMPETITIVE POSITION"
                , div [ style "margin-top" "20px" ]
                    []
                ]
            ]
        , button
            [ Html.Attributes.style "padding" "30px"
            , Html.Attributes.style "background-color" "#f21d9c"
            , Html.Attributes.style "color" "#ffffff"
            , Html.Attributes.style "border-width" "0px"
            , Html.Attributes.style "font-size" "20px"
            , onClick
                (SceneManager
                    (ChangeTo
                        Ui.Scenes.FinishMenu.Update.restoreInitialModel
                        Menu
                    )
                )
            ]
            [ text "Back to Menu" ]
        ]
