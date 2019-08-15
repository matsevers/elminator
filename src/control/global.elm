module Control.Global exposing (keyDecoder, toKey)

import Control.Types exposing (Action(..))
import Json.Decode exposing (..)


keyDecoder : Json.Decode.Decoder Action
keyDecoder =
    Json.Decode.map toKey (Json.Decode.field "key" Json.Decode.string)


toKey : String -> Action
toKey val =
    case val of
        "w" ->
            Forward

        "a" ->
            Left

        "s" ->
            Backward

        "d" ->
            Right

        _ ->
            Control.Types.Nothing
