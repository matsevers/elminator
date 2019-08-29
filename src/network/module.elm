module Network.Module exposing (close, cmdPort, encodeLobby, encodeLobbyControl, encodePlayer, open, parse, parseReturn, run, send, subPort, update)

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


encodeLobbyControl : LobbyControl -> String
encodeLobbyControl lobbyControl =
    Json.Encode.encode 0
        (Json.Encode.object (Network.Encode.encodeLobbyControl lobbyControl))


encodePlayer : Player -> String
encodePlayer player =
    Json.Encode.encode 0 (Json.Encode.object (Network.Encode.encodePlayer player))


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
