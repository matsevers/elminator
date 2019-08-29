module Ui.Scenes.MainMenu.CarPicker exposing (view)

import Html
import Html.Attributes
import Html.Events
import Types


view : Types.Model -> List (Html.Html Types.Msg)
view model =
    renderCars model.availableCars model


renderCars : List Types.GameObject -> Types.Model -> List (Html.Html Types.Msg)
renderCars l model =
    let
        renderCar : Types.GameObject -> Html.Html Types.Msg
        renderCar car =
            let
                checkSelection : List (Html.Attribute msg)
                checkSelection =
                    if car.identifier == model.myPlayer.controlledObject.identifier then
                        [ Html.Attributes.style "background-color" "rgba(255,255,255, 0.4)" ]

                    else
                        []
            in
            Html.div
                ([ Html.Attributes.style "display" "flex"
                 , Html.Attributes.style "align-self" "stretch"
                 , Html.Attributes.style "flex-direction" "column"
                 , Html.Attributes.style "align-items" "center"
                 , Html.Attributes.style "font-size" "14px"
                 , Html.Attributes.style "background-color" "rgba(255,255,255, 0.2)"
                 , Html.Attributes.style "padding" "10px"
                 , Html.Attributes.style "margin" "10px"
                 , Html.Attributes.style "cursor" "pointer"
                 , Html.Events.onClick
                    (Types.MainMenu
                        (Types.ChangeCar
                            model
                            car
                        )
                    )
                 ]
                    ++ checkSelection
                )
                [ Html.div
                    [ Html.Attributes.style "font-size" "20px"
                    , Html.Attributes.style "display" "flex"
                    , Html.Attributes.style "justify-content" "space-between"
                    , Html.Attributes.style "width" "100%"
                    ]
                    [ Html.div [] [ Html.text car.identifier ]
                    , Html.img
                        [ Html.Attributes.src car.sprite
                        , Html.Attributes.style "height" "25px"
                        ]
                        []
                    ]
                ]
    in
    case l of
        [] ->
            []

        x :: xs ->
            renderCar x :: renderCars xs model
