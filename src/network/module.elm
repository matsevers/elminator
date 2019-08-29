module Network.Module exposing (close, cmdPort, encodeLobby, encodeLobbyControl, encodePlayer, open, parse, parseReturn, run, send, subPort, update, updateTtl)

import List
import Network.Commands
import Network.Ports exposing (..)
import Network.PredefinedMessages exposing (..)
import Network.Scheme
import Network.Update exposing (..)
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
encodeLobby =
    Network.Commands.encodeLobby


encodeLobbyControl : LobbyControl -> String
encodeLobbyControl =
    Network.Commands.encodeLobbyControl


encodePlayer : Player -> String
encodePlayer =
    Network.Commands.encodePlayer


updateTtl : Model -> Model
updateTtl model =
    let
        network =
            model.network

        lobbyPool =
            network.lobbyPool

        decreaseTll : List Lobby -> List Lobby
        decreaseTll l =
            List.filter (\x -> x.ttl > 0) <|
                List.map (\x -> { x | ttl = x.ttl - model.frequence }) l
    in
    { model | network = { network | lobbyPool = decreaseTll lobbyPool } }


run : msg -> Cmd msg
run =
    Network.Commands.run


open : Cmd Msg
open =
    Network.Commands.open


send : String -> String -> Cmd Msg
send =
    Network.Commands.send


close : Cmd Msg
close =
    Network.Commands.close
