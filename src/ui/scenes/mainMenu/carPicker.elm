module Ui.Scenes.MainMenu.CarPicker exposing (view)

import Html
import Html.Attributes
import Html.Events
import Types
import Ui.Scenes.MainMenu.Style
import Ui.Scenes.Style


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
                        [ Html.Attributes.style
                            "background-color"
                            "rgba(255,255,255, 0.4)"
                        ]

                    else
                        []
            in
            Html.div
                (Ui.Scenes.Style.selectionContainer
                    ++ [ Html.Events.onClick
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
                    Ui.Scenes.MainMenu.Style.carSelectionInnerContainer
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
