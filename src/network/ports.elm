port module Network.Ports exposing (cmdPort, parse, parseReturn, subPort)

import Json.Encode


port cmdPort : Json.Encode.Value -> Cmd msg


port subPort : (Json.Encode.Value -> msg) -> Sub msg


port parse : String -> Cmd msg


port parseReturn : (Json.Encode.Value -> msg) -> Sub msg
