module Network.Update exposing (update)

import Json.Decode exposing (..)
import Json.Encode exposing (..)
import Network.Ports exposing (..)
import Types exposing (..)


update : Websocketmsg -> Model -> ( Model, Cmd Msg )
update wsMessage model =
    case wsMessage of
        Process v ->
            -- log sent messages
            let
                message =
                    Debug.log "send" (Json.Encode.encode 0 v)
            in
            ( model, cmdPort v )

        Receive v ->
            -- log received messages
            let
                message =
                    Debug.log "Receive" (Json.Encode.encode 0 v)

                decodedMessage =
                    Json.Decode.decode 0 v
            in
            ( model, Cmd.none )

        Send m ->
            ( model, parse m )
