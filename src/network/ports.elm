port module Network.Ports exposing (cmdPort, parse, parseReturn, subPort)

import Json.Encode exposing (..)


port cmdPort : Value -> Cmd msg


port subPort : (Value -> msg) -> Sub msg


port parse : String -> Cmd msg


port parseReturn : (Value -> msg) -> Sub msg
