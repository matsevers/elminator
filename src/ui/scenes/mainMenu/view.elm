module Ui.Scenes.MainMenu.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Network.Module exposing (..)
import Types exposing (..)
import Ui.Scenes.MainMenu.CarPicker exposing (..)
import Ui.Scenes.MainMenu.MapPicker exposing (..)
import Ui.Scenes.Style


view : Model -> Html Msg
view model =
    div
        (Ui.Scenes.Style.globalContainer ++ Ui.Scenes.Style.menuContainer)
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
                , style "align-items" "stretch"
                , style "flex-direction" "column"
                , style "color" "#fff"
                , style "font-size" "25px"
                , style "font-family" "Arial"
                , style "padding" "20px"
                , style "background-color" "#763fdd"
                , Html.Attributes.style "transform" "perspective(400px) rotateY(15deg) rotateX(5deg)"
                , style "margin" "20px"
                ]
                [ div [ style "text-align" "center" ] [ text "CHOOSE A TRACK" ]
                , div [ style "margin-top" "20px", style "margin-bottom" "20px" ] (Ui.Scenes.MainMenu.MapPicker.view model)
                , div [ style "text-align" "center" ] [ text "CHOOSE A VEHICLE" ]
                , div [ style "margin-top" "20px" ]
                    (Ui.Scenes.MainMenu.CarPicker.view model)
                ]
            , div
                [ style "flex-basis" "20%"
                , style "flex-grow" "0"
                , style "display" "flex"
                , style "align-items" "stretch"
                , style "flex-direction" "column"
                , style "color" "#fff"
                , style "font-size" "25px"
                , style "font-family" "Arial"
                , style "padding" "20px"
                , style "background-color" "#E664DD"
                , Html.Attributes.style "transform" "perspective(400px) rotateY(-15deg) rotateX(5deg)"
                , style "margin" "20px"
                ]
                [ div [ style "text-align" "center" ] [ text "DRIVERS NAME" ]
                , div [ style "display" "flex", style "margin-top" "20px" ]
                    [ div [ style "flex" "1" ] []
                    , input
                        [ style "flex" "1"
                        , style "font-size" "22px"
                        , style "color" "#fff"
                        , style "background-color" "transparent"
                        , style "border" "0px solid #fff"
                        , style "border-bottom" "1px solid rgba(255,255,255,0.5)"
                        , placeholder "Text to reverse"
                        , value model.myPlayer.label.text
                        , onInput (\x -> MainMenu (ChangeName model x))
                        ]
                        []
                    , div [ style "flex" "1" ] []
                    ]
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
                        model
                        PrepareRace
                    )
                )
            ]
            [ text "Start the engines" ]
        ]
