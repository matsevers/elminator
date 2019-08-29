module Ui.Scenes.MainMenu.GameOptions exposing (view)

import Html
import Html.Attributes
import Html.Events
import Types
import Ui.Scenes.MainMenu.Style
import Ui.Scenes.Style


view : Types.Model -> Html.Html Types.Msg
view model =
    let
        multiplayer : String
        multiplayer =
            if model.network.multiplayer then
                "true"

            else
                "false"
    in
    Html.div
        (Ui.Scenes.MainMenu.Style.selectionContainer
            ++ Ui.Scenes.Style.spaceTop
            ++ [ Html.Attributes.style "cursor" "default"
               , Html.Attributes.style "display" "flex"
               , Html.Attributes.style "flex-direction" "row"
               ]
        )
        [ Html.div [ Html.Attributes.style "flex" "1" ]
            [ Html.label
                [ Html.Attributes.style "padding" "20px" ]
                [ Html.input
                    [ Html.Attributes.type_ "checkbox"
                    , Html.Events.onClick (Types.MainMenu (Types.ChangeGameType model))
                    , Html.Attributes.value
                        multiplayer
                    ]
                    []
                , Html.text "Multiplayer"
                ]
            ]
        , Html.div [ Html.Attributes.style "flex" "1" ]
            [ Html.text "Max. Player"
            , Html.input
                (Ui.Scenes.MainMenu.Style.input
                    ++ [ Html.Attributes.value
                            (String.fromInt model.ownLobby.maxPlayer)
                       , Html.Events.onInput
                            (\x -> Types.MainMenu (Types.ChangePlayerCount model x))
                       ]
                )
                []
            ]
        ]
