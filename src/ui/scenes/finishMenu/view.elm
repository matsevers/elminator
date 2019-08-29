module Ui.Scenes.FinishMenu.View exposing (view)

import Html
import Html.Attributes
import Html.Events
import Types
import Ui.Scenes.FinishMenu.Update
import Ui.Scenes.Style


view : Types.Model -> Html.Html Types.Msg
view model =
    Html.div
        (Ui.Scenes.Style.globalContainer ++ Ui.Scenes.Style.menuContainer)
        [ Html.img
            [ Html.Attributes.src "assets/logo.png"
            , Html.Attributes.style "width" "70vh"
            , Html.Attributes.style "height" "auto"
            ]
            []
        , Html.div
            [ Html.Attributes.style "display" "flex"
            , Html.Attributes.style "flex-direction" "row"
            , Html.Attributes.style "width" "100%"
            , Html.Attributes.style "justify-content" "center"
            ]
            [ Html.div
                [ Html.Attributes.style "display" "flex"
                , Html.Attributes.style "flex-basis" "20%"
                , Html.Attributes.style "flex-grow" "0"
                , Html.Attributes.style "align-items" "center"
                , Html.Attributes.style "flex-direction" "column"
                , Html.Attributes.style "color" "#fff"
                , Html.Attributes.style "font-size" "25px"
                , Html.Attributes.style "font-family" "Arial"
                , Html.Attributes.style "padding" "20px"
                , Html.Attributes.style "background-color" "#763fdd"
                , Html.Attributes.style
                    "transform"
                    "perspective(400px) rotateY(15deg) rotateX(5deg)"
                , Html.Attributes.style "margin" "20px"
                ]
                [ Html.text "YOUR TIME"
                , Html.div [ Html.Attributes.style "margin-top" "20px" ] []
                ]
            , Html.div
                [ Html.Attributes.style "flex-basis" "20%"
                , Html.Attributes.style "flex-grow" "0"
                , Html.Attributes.style "display" "flex"
                , Html.Attributes.style "align-items" "center"
                , Html.Attributes.style "flex-direction" "column"
                , Html.Attributes.style "color" "#fff"
                , Html.Attributes.style "font-size" "25px"
                , Html.Attributes.style "font-family" "Arial"
                , Html.Attributes.style "padding" "20px"
                , Html.Attributes.style "background-color" "#E664DD"
                , Html.Attributes.style
                    "transform"
                    "perspective(400px) rotateY(-15deg) rotateX(5deg)"
                , Html.Attributes.style "margin" "20px"
                ]
                [ Html.text "COMPETITIVE POSITION"
                , Html.div [ Html.Attributes.style "margin-top" "20px" ]
                    []
                ]
            ]
        , Html.button
            [ Html.Attributes.style "padding" "30px"
            , Html.Attributes.style "background-color" "#f21d9c"
            , Html.Attributes.style "color" "#ffffff"
            , Html.Attributes.style "border-width" "0px"
            , Html.Attributes.style "font-size" "20px"
            , Html.Events.onClick
                (Types.SceneManager
                    (Types.ChangeTo
                        Ui.Scenes.FinishMenu.Update.restoreInitialModel
                        Types.Menu
                    )
                )
            ]
            [ Html.text "Back to Menu" ]
        ]
