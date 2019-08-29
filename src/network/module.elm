module Network.Module exposing (close, cmdPort, encodeLobby, encodePlayer, open, parse, parseReturn, run, send, subPort, update, wsSendUpdate)

import Json.Decode exposing (..)
import Json.Encode exposing (Value)
import Network.Encode
import Network.Ports exposing (..)
import Network.PredefinedMessages exposing (..)
import Network.Scheme
import Network.Update exposing (..)
import Task exposing (..)
import Types exposing (..)


cmdPort =
    Network.Ports.cmdPort


subPort =
    Network.Ports.subPort


parse =
    Network.Ports.parse


parseReturn =
    Network.Ports.parseReturn


update =
    Network.Update.update


encodeLobby : Lobby -> String
encodeLobby lobby =
    Json.Encode.encode 0
        (Json.Encode.object (Network.Encode.encodeLobby lobby))


encodePlayer : Player -> String
encodePlayer player =
    Json.Encode.encode 0 (Json.Encode.object (Network.Encode.encodePlayer player))


wsSendUpdate : Model -> Model
wsSendUpdate model =
    let
        myPlayer =
            model.myPlayer

        jsonObject : Value
        jsonObject =
            -- Json.Encode.object (Debug.log "jsonObjectList " (Network.Scheme.encode myPlayer))
            Json.Encode.object (Network.Encode.encodePlayer myPlayer)

        json : String
        json =
            -- Debug.log "JsonString" (Json.Encode.encode 0 (Debug.log "JsonValue " jsonObject))
            Json.Encode.encode 0 jsonObject
    in
    { model | wsSend = json }


run : msg -> Cmd msg
run m =
    Task.perform (always m) (Task.succeed ())


open : Cmd Msg
open =
    run (Websocket (Send openJson))


send : String -> String -> Cmd Msg
send field message =
    run (Websocket (Send (sendJson2 field message)))


close : Cmd Msg
close =
    run (Websocket (Send closeJson))
