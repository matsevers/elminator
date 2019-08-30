module Network.Module exposing
    ( close
    , cmdPort
    , encodeLobby
    , encodeLobbyControl
    , encodePlayer
    , open
    , parse
    , parseReturn
    , run
    , send
    , subPort
    , update
    , updateTtl
    )

import List
import Network.Commands
import Network.Ports
import Network.PredefinedMessages
import Network.Scheme
import Network.Update
import Types


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


encodeLobby : Types.Lobby -> String
encodeLobby =
    Network.Commands.encodeLobby


encodeLobbyControl : Types.LobbyControl -> String
encodeLobbyControl =
    Network.Commands.encodeLobbyControl


encodePlayer : Types.Player -> String
encodePlayer =
    Network.Commands.encodePlayer


updateTtl : Types.Model -> Types.Model
updateTtl model =
    let
        network =
            model.network

        lobbyPool =
            network.lobbyPool

        decreaseTll : List Types.Lobby -> List Types.Lobby
        decreaseTll l =
            List.filter (\x -> x.ttl > 0) <|
                List.map (\x -> { x | ttl = x.ttl - model.frequence }) l
    in
    { model | network = { network | lobbyPool = decreaseTll lobbyPool } }


run : msg -> Cmd msg
run =
    Network.Commands.run


open : Cmd Types.Msg
open =
    Network.Commands.open


send : String -> String -> Cmd Types.Msg
send =
    Network.Commands.send


close : Cmd Types.Msg
close =
    Network.Commands.close
