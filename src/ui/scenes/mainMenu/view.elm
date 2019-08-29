module Ui.Scenes.MainMenu.View exposing (view)

import Html
import Html.Attributes
import Html.Events
import Network.Module
import Types
import Ui.Scenes.MainMenu.CarPicker
import Ui.Scenes.MainMenu.MapPicker
import Ui.Scenes.MainMenu.Style
import Ui.Scenes.Style


view : Types.Model -> Html.Html Types.Msg
view model =
    let
        menuItemGameOptions : Html.Html Types.Msg
        menuItemGameOptions =
            Html.div
                ([ Html.Attributes.style "background-color"
                    "#763fdd"
                 , Html.Attributes.style "transform"
                    "perspective(400px) rotateY(15deg) rotateX(5deg)"
                 ]
                    ++ Ui.Scenes.Style.menuItem
                )
                [ Html.div Ui.Scenes.Style.centeredText
                    [ Html.text "CHOOSE A TRACK" ]
                , Html.div
                    (Ui.Scenes.MainMenu.Style.spaceTop
                        ++ Ui.Scenes.MainMenu.Style.spaceBottom
                    )
                    (Ui.Scenes.MainMenu.MapPicker.view model)
                , Html.div Ui.Scenes.Style.centeredText
                    [ Html.text "CHOOSE A VEHICLE" ]
                , Html.div Ui.Scenes.MainMenu.Style.spaceTop
                    (Ui.Scenes.MainMenu.CarPicker.view model)
                ]

        menuItemPlayerOptions : Html.Html Types.Msg
        menuItemPlayerOptions =
            Html.div
                ([ Html.Attributes.style
                    "background-color"
                    "#E664DD"
                 , Html.Attributes.style
                    "transform"
                    "perspective(400px) rotateY(-15deg) rotateX(5deg)"
                 ]
                    ++ Ui.Scenes.Style.menuItem
                )
                [ Html.div
                    Ui.Scenes.Style.centeredText
                    [ Html.text "DRIVERS NAME" ]
                , Html.div
                    ([ Html.Attributes.style "display" "flex" ]
                        ++ Ui.Scenes.MainMenu.Style.spaceTop
                    )
                    [ Html.div [ Html.Attributes.style "flex" "1" ] []
                    , Html.input
                        (Ui.Scenes.MainMenu.Style.input
                            ++ [ Html.Attributes.placeholder
                                    "Text to reverse"
                               , Html.Attributes.value
                                    model.myPlayer.label.text
                               , Html.Events.onInput
                                    (\x -> Types.MainMenu (Types.ChangeName model x))
                               ]
                        )
                        []
                    , Html.div [ Html.Attributes.style "flex" "1" ] []
                    ]
                ]
    in
    Html.div
        (Ui.Scenes.Style.globalContainer ++ Ui.Scenes.Style.menuContainer)
        [ Html.img
            Ui.Scenes.MainMenu.Style.logo
            []
        , Html.div
            Ui.Scenes.MainMenu.Style.menuItemContainer
            [ menuItemGameOptions
            , menuItemPlayerOptions
            ]
        , Html.button
            (Ui.Scenes.Style.button
                ++ [ Html.Events.onClick
                        (Types.SceneManager
                            (Types.ChangeTo
                                model
                                Types.PrepareRace
                            )
                        )
                   ]
            )
            [ Html.text "Start the engines" ]
        ]
