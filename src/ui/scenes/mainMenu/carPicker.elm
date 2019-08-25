module Ui.Scenes.MainMenu.CarPicker exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Types exposing (..)


view : Model -> List (Html Msg)
view model =
    renderCars model.availableCars model


renderCars : List Types.GameObject -> Model -> List (Html Msg)
renderCars l model =
    let
        renderCar : Types.GameObject -> Html Msg
        renderCar car =
            let
                checkSelection : List (Html.Attribute msg)
                checkSelection =
                    if car.identifier == model.myPlayer.controlledObject.identifier then
                        [ style "background-color" "rgba(255,255,255, 0.4)" ]

                    else
                        []
            in
            div
                ([ style "display" "flex"
                 , style "align-self" "stretch"
                 , style "flex-direction" "column"
                 , style "align-items" "center"
                 , style "font-size" "14px"
                 , style "background-color" "rgba(255,255,255, 0.2)"
                 , style "padding" "10px"
                 , style "margin" "10px"
                 , style "cursor" "pointer"
                 , onClick
                    (MainMenu
                        (ChangeCar
                            model
                            car
                        )
                    )
                 ]
                    ++ checkSelection
                )
                [ div [ style "font-size" "20px", style "display" "flex", style "justify-content" "space-between", style "width" "100%" ]
                    [ div [] [ text car.identifier ]
                    , Html.img [ Html.Attributes.src car.sprite, Html.Attributes.style "height" "25px" ] []
                    ]
                ]
    in
    case l of
        [] ->
            []

        x :: xs ->
            renderCar x :: renderCars xs model
