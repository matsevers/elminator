module Network.Update exposing (update)

import Json.Decode exposing (..)
import Json.Encode exposing (..)
import Network.Ports exposing (..)
import Network.Scheme exposing (..)
import Types exposing (..)


update : Websocketmsg -> Model -> ( Model, Cmd Msg )
update wsMessage model =
    case wsMessage of
        Process v ->
            -- log sent messages
            let
                message =
                    Json.Encode.encode 0 v
            in
            ( model, cmdPort v )

        Receive v ->
            -- log received messages
            let
                message =
                    Network.Scheme.decode (Json.Encode.encode 0 v)
            in
            case message of
                Just player ->
                    ( { model | onlinePlayers = [ player ] }, Cmd.none )

                Maybe.Nothing ->
                    ( model, Cmd.none )

        Send m ->
            let
                neu = m
            in
            ( model, parse (Debug.log "Send " neu) )
