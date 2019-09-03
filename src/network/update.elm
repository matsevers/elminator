module Network.Update exposing (update)

import Cmd.Extra
import Json.Decode
import Json.Encode
import List
import Network.Commands
import Network.Decode
import Network.Ports
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
            ( model, Network.Ports.cmdPort v )

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
                                |> Cmd.Extra.withNoCmd

                        ( _, Just lobby, _ ) ->
                            updateLobbyPool model lobby |> Cmd.Extra.withNoCmd

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
                                model |> Cmd.Extra.withCmd (Network.Commands.run (Types.SceneManager (Types.ChangeTo model Types.Finished)))

                            else if lobbyId == ownLobbyId && lobbyControl.join then
                                addPlayerToOwnLobby model senderId |> checkLobbyState

                            else if lobbyId == ownLobbyId && lobbyControl.leave then
                                ( removePlayerFromLobby model lobbyControl, Cmd.none )

                            else if lobbyControl.start && lobbyControl.identifier == model.network.session then
                                model |> Cmd.Extra.withCmd (Network.Commands.run (Types.SceneManager (Types.ChangeTo model Types.PrepareRace)))

                            else
                                model |> Cmd.Extra.withNoCmd

                        _ ->
                            model |> Cmd.Extra.withNoCmd

                Maybe.Nothing ->
                    model |> Cmd.Extra.withNoCmd

        Types.Send m ->
            ( model, Network.Ports.parse m )


updateLobbyPool : Types.Model -> Types.Lobby -> Types.Model
updateLobbyPool model lobby =
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
    if ownLobby.maxPlayer > List.length ownLobby.onlinePlayers then
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

        oL =
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
    if ownLobby.maxPlayer <= List.length ownLobby.onlinePlayers then
        let
            updatedModel =
                { model | ownLobby = { oL | running = True } }
        in
        ( updatedModel
        , Cmd.batch
            [ Network.Commands.send
                "lobbyControl"
                (Network.Commands.encodeLobbyControl lobbyControlMessageStart)
            , Network.Commands.run
                (Types.SceneManager
                    (Types.ChangeTo updatedModel Types.PrepareRace)
                )
            ]
        )

    else
        ( model, Cmd.none )
