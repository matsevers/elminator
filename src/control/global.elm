module Control.Global exposing (Action(..), Keys(..), keyDecoder, toKey)

import Json.Decode exposing (..)


type Keys
    = W
    | A
    | S
    | D
    | Other


type Action
    = Forward
    | Backward
    | Left
    | Right
    | Nothing


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
            Nothing
