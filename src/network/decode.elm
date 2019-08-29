module Network.Decode exposing (Args, Message, argsDecoder, decode, lobbyDecoder, messageDecoder, playerDecoder)

import Json.Decode exposing (..)
import Json.Decode.Extra exposing (..)
import String
import Types exposing (..)


type alias Args =
    { message : Message
    , key : String
    }


type alias Message =
    { lobby : Maybe Lobby
    , player : Maybe SchemePlayer
    , lobbyControl : Maybe LobbyControl
    }


decode : String -> Maybe Message
decode json =
    let
        message =
            Json.Decode.decodeString (field "args" argsDecoder) json
    in
    case message of
        Ok m ->
            Just m.message

        _ ->
            Maybe.Nothing


playerDecoder : Decoder SchemePlayer
playerDecoder =
    succeed SchemePlayer
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "identifier" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "label" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "labelCol" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "labelSize" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "labelVisible" Json.Decode.bool)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "currentLab" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "time" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "catchedCheckpoints" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOIdentifier" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOPositionX" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOPositionY" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOSprite" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOSpriteMinimap" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gORotate" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOSizeHeight" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "gOSizeWidth" Json.Decode.int)


lobbyDecoder : Decoder Lobby
lobbyDecoder =
    succeed Lobby
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "identifier" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "maxPlayer" Json.Decode.int)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "map" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "onlinePlayers" (Json.Decode.list string))


lobbyControlDecoder : Decoder LobbyControl
lobbyControlDecoder =
    succeed LobbyControl
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "identifier" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "playerId" Json.Decode.string)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "join" Json.Decode.bool)
        |> Json.Decode.Extra.andMap
            (Json.Decode.field "finish" Json.Decode.bool)


messageDecoder : Decoder Message
messageDecoder =
    succeed Message
        |> Json.Decode.Extra.andMap
            (Json.Decode.maybe (Json.Decode.field "lobby" lobbyDecoder))
        |> Json.Decode.Extra.andMap
            (Json.Decode.maybe (Json.Decode.field "player" playerDecoder))
        |> Json.Decode.Extra.andMap
            (Json.Decode.maybe (Json.Decode.field "lobbyControl" lobbyControlDecoder))


argsDecoder : Decoder Args
argsDecoder =
    succeed Args
        |> Json.Decode.Extra.andMap (Json.Decode.field "message" messageDecoder)
        |> Json.Decode.Extra.andMap (Json.Decode.field "key" Json.Decode.string)
