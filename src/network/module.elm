port module Network.Module exposing (cmdPort, parse, parseReturn, subPort, update)

import Json.Decode exposing (..)
import Json.Encode exposing (Value)
import Types exposing (..)


port cmdPort : Value -> Cmd msg


port subPort : (Value -> msg) -> Sub msg


port parse : String -> Cmd msg


port parseReturn : (Value -> msg) -> Sub msg


update : Websocketmsg -> Model -> ( Model, Cmd Msg )
update wsMessage model =
    case wsMessage of
        Process v ->
            -- zeige gesendete Nachricht
            let
                message =
                    Debug.log "send" (Json.Encode.encode 0 v)
            in
            ( model, cmdPort v )

        Receive v ->
            -- receiveFromWebsocket
            let
                message =
                    Debug.log "Receive" (Json.Encode.encode 0 v)
            in
            ( model, Cmd.none )

        Send ->
            let
                updatedModel =
                    { model | wsSend = openJson }
            in
            ( updatedModel, parse updatedModel.wsSend )



-- Websocket Teil


convertcontrolledObjectToString : Model -> String
convertcontrolledObjectToString m =
    "controlledObject"


openJson : String
openJson =
    String.trim
        """
         {"module": "WebSocket", "tag": "open", "args": {"url": "ws://nas.janke.cloud:60000"}}
        """


sendJson : String
sendJson =
    String.trim
        """
       {"module": "WebSocket", "tag": "send", "args": {"key": "anderenKey", "message": "controlledObject!"}}
      """


closeJson : String
closeJson =
    String.trim
        """
         {"module": "WebSocket", "tag": "close", "args": {"key": "foo", "reason": "Just because."}}
        """



-- Websocket Teil
