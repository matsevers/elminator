module Network.Commands exposing (close, encodeLobby, encodeLobbyControl, encodePlayer, open, run, send)

import Json.Encode
import Network.Encode
import Network.PredefinedMessages
import Task
import Types


run : msg -> Cmd msg
run m =
    Task.perform (always m) (Task.succeed ())


open : Cmd Types.Msg
open =
    run
        (Types.Websocket
            (Types.Send Network.PredefinedMessages.openJson)
        )


send : String -> String -> Cmd Types.Msg
send field message =
    run
        (Types.Websocket
            (Types.Send
                (Network.PredefinedMessages.sendJson2 field message)
            )
        )


close : Cmd Types.Msg
close =
    run
        (Types.Websocket
            (Types.Send Network.PredefinedMessages.closeJson)
        )


encodeLobby : Types.Lobby -> String
encodeLobby lobby =
    Json.Encode.encode 0
        (Json.Encode.object
            (Network.Encode.encodeLobby lobby)
        )


encodeLobbyControl : Types.LobbyControl -> String
encodeLobbyControl lobbyControl =
    Json.Encode.encode 0
        (Json.Encode.object
            (Network.Encode.encodeLobbyControl lobbyControl)
        )


encodePlayer : Types.Player -> String
encodePlayer player =
    Json.Encode.encode 0
        (Json.Encode.object
            (Network.Encode.encodePlayer player)
        )
