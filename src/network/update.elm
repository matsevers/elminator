module Network.Update exposing (update)

import Cmd.Extra exposing (withCmd, withNoCmd)
import Json.Decode exposing (..)
import Json.Encode exposing (..)
import List
import Network.Commands
import Network.Decode exposing (..)
import Network.Ports exposing (..)
import Network.Scheme
import Types


update : Types.Websocketmsg -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update wsMessage model =
    case wsMessage of
        Types.Process v ->
            -- log sent messages
            let
                message =
                    Json.Encode.encode 0 v
            in
            ( model, cmdPort v )

        Types.Receive v ->
            -- log received messages
            let
                message =
                    Network.Decode.decode (Json.Encode.encode 0 v)
            in
            case message of
                Just m ->
                    case ( m.player, m.lobby, m.lobbyControl ) of
                        ( Just player, _, _ ) ->
                            let
                                p =
                                    Network.Scheme.player player
                            in
                            { model
                                | onlinePlayers =
                                    p
                                        :: List.filter (\x -> not (x.identifier == p.identifier))
                                            model.onlinePlayers
                            }
                                |> withNoCmd

                        ( _, Just lobby, _ ) ->
                            let
                                network =
                                    model.network
                            in
                            { model
                                | network =
                                    { network
                                        | lobbyPool =
                                            lobby
                                                :: List.filter (\x -> not (x.identifier == lobby.identifier))
                                                    network.lobbyPool
                                    }
                            }
                                |> withNoCmd

                        ( _, _, Just lobbyControl ) ->
                            let
                                lobbyId =
                                    lobbyControl.identifier

                                senderId =
                                    lobbyControl.playerId

                                ownLobby =
                                    model.ownLobby

                                ownLobbyId =
                                    ownLobby.identifier
                            in
                            if lobbyControl.finish && (lobbyControl.identifier == model.network.session || lobbyControl.identifier == ownLobbyId) then
                                model |> withCmd (Network.Commands.run (Types.SceneManager (Types.ChangeTo model Types.Finished)))

                            else if lobbyId == ownLobbyId && lobbyControl.join then
                                addPlayerToOwnLobby model senderId |> checkLobbyState

                            else if lobbyId == ownLobbyId && lobbyControl.leave then
                                ( removePlayerFromLobby model lobbyControl, Cmd.none )

                            else if lobbyControl.start && lobbyControl.identifier == model.network.session then
                                model |> withCmd (Network.Commands.run (Types.SceneManager (Types.ChangeTo model Types.PrepareRace)))

                            else
                                model |> withNoCmd

                        _ ->
                            model |> withNoCmd

                Maybe.Nothing ->
                    model |> withNoCmd

        Types.Send m ->
            let
                neu =
                    -- Debug.log "Send " m
                    m
            in
            ( model, parse neu )


removePlayerFromLobby : Types.Model -> Types.LobbyControl -> Types.Model
removePlayerFromLobby model lobbyControl =
    let
        ownLobby =
            model.ownLobby
    in
    { model
        | ownLobby =
            { ownLobby
                | onlinePlayers =
                    List.filter
                        (\x -> not (x == lobbyControl.playerId))
                        ownLobby.onlinePlayers
            }
    }


addPlayerToOwnLobby : Types.Model -> String -> Types.Model
addPlayerToOwnLobby model uuid =
    let
        ownLobby =
            model.ownLobby
    in
    if (ownLobby.maxPlayer - 1) > List.length ownLobby.onlinePlayers then
        { model
            | ownLobby =
                { ownLobby
                    | onlinePlayers =
                        uuid
                            :: List.filter (\x -> not (x == uuid))
                                model.ownLobby.onlinePlayers
                }
        }

    else
        model


checkLobbyState : Types.Model -> ( Types.Model, Cmd Types.Msg )
checkLobbyState model =
    let
        ownLobby =
            model.ownLobby

        lobbyControlMessageStart : Types.LobbyControl
        lobbyControlMessageStart =
            { identifier = ownLobby.identifier
            , playerId = model.myPlayer.identifier
            , start = True
            , finish = False
            , join = False
            , leave = False
            }
    in
    if ownLobby.maxPlayer - 1 <= List.length ownLobby.onlinePlayers then
        ( model
        , Cmd.batch
            [ Network.Commands.send
                "lobbyControl"
                (Network.Commands.encodeLobbyControl lobbyControlMessageStart)
            , Network.Commands.run
                (Types.SceneManager (Types.ChangeTo model Types.PrepareRace))
            ]
        )

    else
        ( model, Cmd.none )
