module Ui.Scenes.MainMenu.LobbyPicker exposing (view)

import Html
import Html.Attributes
import Html.Events
import List
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
            Html.div
                (Ui.Scenes.MainMenu.Style.selectionContainer
                    ++ [ Html.Attributes.style "display" "flex"
                       , Html.Attributes.style "flex-direction" "row"
                       , Html.Events.onClick (lobbyAction model lobby)
                       ]
                )
                [ Html.div [ Html.Attributes.style "flex" "20" ] [ Html.text (lobby.map ++ " (" ++ String.fromInt (List.length lobby.onlinePlayers + 1) ++ " / " ++ String.fromInt lobby.maxPlayer ++ ")") ]
                , Html.div [ Html.Attributes.style "flex" "1" ] (renderLoadingAnimation model lobby)
                ]
    in
    Html.div []
        (renderLobbies (List.filter (\lobby -> lobby.map == model.map.meta.name) model.network.lobbyPool))


lobbyAction : Types.Model -> Types.Lobby -> Types.Msg
lobbyAction model lobby =
    if model.network.session == lobby.identifier then
        Types.MainMenu (Types.LeaveLobby model lobby)

    else
        Types.MainMenu (Types.JoinLobby model lobby)


renderLoadingAnimation : Types.Model -> Types.Lobby -> List (Html.Html Types.Msg)
renderLoadingAnimation model lobby =
    if model.network.session == lobby.identifier then
        [ Html.img [ Html.Attributes.src "assets/wheel.gif", Html.Attributes.width 60 ] [] ]

    else
        []
