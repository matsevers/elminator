module Network.Update exposing (update)

import Json.Decode exposing (..)
import Json.Encode exposing (..)
import List
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
                            ( { model
                                | onlinePlayers =
                                    p
                                        :: List.filter (\x -> not (x.identifier == p.identifier))
                                            model.onlinePlayers
                              }
                            , Cmd.none
                            )

                        ( _, Just lobby, _ ) ->
                            let
                                network =
                                    model.network
                            in
                            ( { model
                                | network =
                                    { network
                                        | lobbyPool =
                                            lobby
                                                :: List.filter (\x -> not (x.identifier == lobby.identifier))
                                                    network.lobbyPool
                                    }
                              }
                            , Cmd.none
                            )

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
                            if lobbyId == ownLobbyId && lobbyControl.join then
                                ( { model
                                    | ownLobby =
                                        { ownLobby
                                            | onlinePlayers =
                                                senderId
                                                    :: List.filter (\x -> not (x == senderId))
                                                        model.ownLobby.onlinePlayers
                                        }
                                  }
                                , Cmd.none
                                )

                            else
                                ( model, Cmd.none )

                        _ ->
                            ( model, Cmd.none )

                Maybe.Nothing ->
                    ( model, Cmd.none )

        Types.Send m ->
            let
                neu =
                    -- Debug.log "Send " m
                    m
            in
            ( model, parse neu )
