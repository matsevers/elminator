module Network.Scheme exposing (decode, encode)

import Json.Decode exposing (..)
import Json.Decode.Extra exposing (..)
import Json.Encode exposing (..)
import List exposing (..)
import Types exposing (..)


encode : Player -> List ( String, Json.Encode.Value )
encode player =
    let
        gO =
            player.controlledObject

        gOPosition =
            Maybe.withDefault { x = 0, y = 0 } gO.position

        spriteMinimap =
            Maybe.withDefault "" gO.spriteMinimap
    in
    [ ( "identifier", Json.Encode.string player.identifier )
    , ( "label", Json.Encode.string player.label.text )
    , ( "labelCol", Json.Encode.string player.label.color )
    , ( "labelSize", Json.Encode.int player.label.size )
    , ( "labelVisible", Json.Encode.bool player.label.visible )
    , ( "currentLab", Json.Encode.int player.currentLab )
    , ( "time", Json.Encode.int player.time )
    , ( "catchedCheckpoints", Json.Encode.int (length player.catchedCheckpoints) )
    , ( "gOIdentifier", Json.Encode.string gO.identifier )
    , ( "gOPositionX", Json.Encode.int gOPosition.x )
    , ( "gOPositionY", Json.Encode.int gOPosition.y )
    , ( "gOSprite", Json.Encode.string gO.sprite )
    , ( "gOSpriteMinimap", Json.Encode.string spriteMinimap )
    , ( "gORotate", Json.Encode.int gO.rotate )
    , ( "gOSizeHeight", Json.Encode.int gO.size.height )
    , ( "gOSizeWidth", Json.Encode.int gO.size.width )
    ]


type alias Args =
    { message : Message
    , key : String
    }


type alias Message =
    { identifier : String
    , label : String
    , labelCol : String
    , labelSize : Int
    , labelVisible : Bool
    , currentLab : Int
    , time : Int
    , catchedCheckpoints : Int
    , gOIdentifier : String
    , gOPositionX : Int
    , gOPositionY : Int
    , gOSprite : String
    , gOSpriteMinimap : String
    , gORotate : Int
    , gOSizeHeight : Int
    , gOSizeWidth : Int
    }


messageDecoder : Decoder Message
messageDecoder =
    succeed Message
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


argsDecoder : Decoder Args
argsDecoder =
    succeed Args
        |> Json.Decode.Extra.andMap (Json.Decode.field "message" messageDecoder)
        |> Json.Decode.Extra.andMap (Json.Decode.field "key" Json.Decode.string)


decode : String -> Maybe Player
decode json =
    let
        message =
            Json.Decode.decodeString (field "args" argsDecoder) json
    in
    case message of
        Ok m ->
            let
                gameObject =
                    { identifier = m.message.gOIdentifier
                    , kind = Car
                    , size = { height = m.message.gOSizeHeight, width = m.message.gOSizeWidth }
                    , position = Just { x = m.message.gOPositionX, y = m.message.gOPositionY }
                    , spriteMinimap = Just m.message.gOSprite
                    , sprite = m.message.gOSprite
                    , collider = Maybe.Nothing
                    , rotate = m.message.gORotate
                    , motion = Maybe.Nothing
                    , physics = Maybe.Nothing
                    }

                player =
                    { identifier = m.message.identifier
                    , assignedKeys =
                        { forward = Types.Other
                        , backward = Types.Other
                        , left = Types.Other
                        , right = Types.Other
                        , action = Types.Other
                        }
                    , storedKeys =
                        { forward = Types.Nothing
                        , backward = Types.Nothing
                        , left = Types.Nothing
                        , right = Types.Nothing
                        }
                    , currentLab = m.message.currentLab
                    , time = m.message.time
                    , controlledObject = gameObject
                    , catchedCheckpoints = []
                    , label = { text = m.message.label, color = m.message.labelCol, size = m.message.labelSize, visible = m.message.labelVisible }
                    }
            in
            Just player

        _ ->
            Maybe.Nothing
