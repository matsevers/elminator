module Ui.Scenes.FinishMenu.View exposing (view)

import Html
import Html.Attributes
import Html.Events
import Types
import Ui.Scenes.FinishMenu.Update
import Ui.Scenes.Style


view : Types.Model -> Html.Html Types.Msg
view model =
    let
        getDriveTimeSeconds : Int
        getDriveTimeSeconds =
            if model.myPlayer.time == 0 then
                0

            else
                model.myPlayer.time // 1000

        getDriveTimeMilliSeconds : String
        getDriveTimeMilliSeconds =
            if model.myPlayer.time == 0 then
                "0"

            else
                let
                    ms =
                        String.fromInt
                            (round
                                (toFloat
                                    (model.myPlayer.time
                                        - (getDriveTimeSeconds * 1000)
                                    )
                                    / 10
                                )
                            )
                in
                if String.length ms == 1 then
                    "0" ++ ms

                else
                    ms
    in
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
                (Ui.Scenes.Style.menuItemLeft
                    ++ Ui.Scenes.Style.menuItem
                    ++ Ui.Scenes.Style.centeredText
                )
                [ Html.text "YOUR TIME"
                , Html.div Ui.Scenes.Style.spaceTop
                    [ Html.text (String.fromInt getDriveTimeSeconds)
                    , Html.text ":"
                    , Html.text getDriveTimeMilliSeconds
                    , Html.text " seconds"
                    ]
                ]
            , Html.div
                (Ui.Scenes.Style.menuItem
                    ++ Ui.Scenes.Style.centeredText
                    ++ Ui.Scenes.Style.menuItemRight
                )
                [ Html.text "COMPETITIVE POSITION"
                , Html.div Ui.Scenes.Style.spaceTop
                    []
                ]
            ]
        , Html.button
            (Ui.Scenes.Style.button
                ++ [ Html.Events.onClick
                        (Types.SceneManager
                            (Types.ChangeTo
                                Ui.Scenes.FinishMenu.Update.restoreInitialModel
                                Types.Menu
                            )
                        )
                   ]
            )
            [ Html.text "Back to Menu" ]
        ]
