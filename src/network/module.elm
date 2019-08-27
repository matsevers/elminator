port module Network.Module exposing (close, closeJson, cmdPort, open, openJson, parse, parseReturn, run, send, sendJson, subPort, update, wsSendUpdate)

import Json.Decode exposing (..)
import Json.Encode exposing (Value)
import Network.Scheme exposing (..)
import Task exposing (..)
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

        Send m ->
            ( model, parse m) 


wsSendUpdate : Model -> Model
wsSendUpdate model =
    let
        myPlayer =
            model.myPlayer

        jsonObject =
            (Json.Encode.object (Network.Scheme.encode myPlayer))

        json =
            (Json.Encode.encode 0 jsonObject)
    in
    { model | wsSend = json }


run : msg -> Cmd msg
run m =
    Task.perform (always m) (Task.succeed ())


open : Cmd Msg
open =
    run (Websocket (Send openJson))


send : String -> Cmd Msg
send message =
    run (Websocket (Send (sendJson message)))


close : Cmd Msg
close =
    run (Websocket (Send closeJson))


openJson : String
openJson =
    String.trim
        """
         {"module": "WebSocket", "tag": "open", "args": {"key": "elminator", "url": "ws://nas.janke.cloud:60000"}}
        """


sendJson : String -> String
sendJson message =
    let  
        json =
            String.trim
                """
             {"module": "WebSocket", "tag": "send", "args": {"key": "elminator", "message": ##placeholder## }}
           """

        replacedJson =
            String.replace "##placeholder##" message json
    in
    replacedJson


closeJson : String
closeJson =
    String.trim
        """
         {"module": "WebSocket", "tag": "close", "args": {"key": "elminator", "reason": "Just because."}}
        """
