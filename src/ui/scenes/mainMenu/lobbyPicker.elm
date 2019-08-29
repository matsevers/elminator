module Ui.Scenes.MainMenu.LobbyPicker exposing (view)

import Html
import Html.Events
import Types
import Ui.Scenes.MainMenu.Style


view : Types.Model -> Html.Html Types.Msg
view model =
    let
        renderLobbies : List Types.Lobby -> List (Html.Html Types.Msg)
        renderLobbies l =
            case l of
                [] ->
                    []

                x :: xs ->
                    renderLobby x :: renderLobbies xs

        renderLobby : Types.Lobby -> Html.Html Types.Msg
        renderLobby lobby =
            Html.div (Ui.Scenes.MainMenu.Style.selectionContainer ++ [ Html.Events.onClick (Types.MainMenu (Types.JoinLobby model lobby)) ]) [ Html.text lobby.map ]
    in
    Html.div []
        (renderLobbies model.network.lobbyPool)
