module Network.Update exposing (update)

import Json.Decode exposing (..)
import Json.Encode exposing (..)
import Network.Decode exposing (..)
import Network.Ports exposing (..)
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
                    case ( m.player, m.lobby ) of
                        ( Just player, _ ) ->
                            ( { model | onlinePlayers = [] }, Cmd.none )

                        ( _, Just lobby ) ->
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
