module Network.Module exposing (close, cmdPort, open, parse, parseReturn, run, send, subPort, update, wsSendUpdate)

import Json.Decode exposing (..)
import Json.Encode exposing (Value)
import Network.Ports exposing (..)
import Network.PredefinedMessages exposing (..)
import Network.Scheme exposing (..)
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


wsSendUpdate : Model -> Model
wsSendUpdate model =
    let
        myPlayer =
            model.myPlayer

        jsonObject =
            Json.Encode.object (Network.Scheme.encode myPlayer)

        json =
            Json.Encode.encode 0 jsonObject
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
