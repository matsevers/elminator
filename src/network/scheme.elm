module Network.Scheme exposing (encode)

import Json.Decode exposing (..)
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
    , ( "currentLab", Json.Encode.int player.currentLab )
    , ( "catchedCheckpoints", Json.Encode.int (length player.catchedCheckpoints) )
    , ( "gOIdentifier", Json.Encode.int gOPosition.identifier )
    , ( "gOPositionX", Json.Encode.int gOPosition.x )
    , ( "gOPositionY", Json.Encode.int gOPosition.y )
    , ( "gOSprite", Json.Encode.string gO.sprite )
    , ( "gOSpriteMinimap", Json.Encode.string spriteMinimap )
    , ( "gORotate", Json.Encode.int gO.rotate )
    , ( "gOSizeHeight", Json.Encode.int gO.size.height )
    , ( "gOSizeWidth", Json.Encode.int gO.size.width )
    ]


decode : String -> Maybe Player
decode jsonPlayer =
    let
        identifier =
            Json.Decode.decodeString (field "identifier" Json.Decode.string) jsonPlayer

        label =
            Json.Decode.decodeString (field "label" Json.Decode.string) jsonPlayer

        currentLab =
            Json.Decode.decodeString (field "currentLab" Json.Decode.int) jsonPlayer

        gOIdentifier =
            Json.Decode.decodeString (field "gOIdentifier" Json.Decode.string) jsonPlayer

        catchedCheckpoints =
            Json.Decode.decodeString (field "catchedCheckpoints" Json.Decode.int) jsonPlayer

        gOPositionX =
            Json.Decode.decodeString (field "gOPositionX" Json.Decode.int) jsonPlayer

        gOPositionY =
            Json.Decode.decodeString (field "gOPositionY" Json.Decode.int) jsonPlayer

        gOSprite =
            Json.Decode.decodeString (field "gOSprite" Json.Decode.string) jsonPlayer

        gOSpriteMinimap =
            Json.Decode.decodeString (field "gOSpriteMinimap" Json.Decode.string) jsonPlayer

        gORotate =
            Json.Decode.decodeString (field "gORotate" Json.Decode.int) jsonPlayer

        gOSizeHeight =
            Json.Decode.decodeString (field "gOSizeHeight" Json.Decode.int) jsonPlayer

        gOSizeWidth =
            Json.Decode.decodeString (field "gOSizeWidth" Json.Decode.int) jsonPlayer
    in
    case ( identifier, label, currentLab ) of
        ( Ok id, Ok la, Ok cL ) ->
            case ( gOIdentifier, catchedCheckpoints, gOPositionX ) of
                ( Ok gOId, Ok cC, Ok pX ) ->
                    case ( gOPositionY, gOSprite, gOSpriteMinimap ) of
                        ( Ok pY, Ok gOSp, Ok gOSpMi ) ->
                            case ( gORotate, gOSizeHeight, gOSizeWidth ) of
                                ( Ok gORo, Ok gOSiHe, Ok gOSoWi ) ->
                                    let
                                        gameObject =
                                            { identifier = gOId
                                            , kind = Car
                                            , size = { height = gOSiHe, width = gOSoWi }
                                            , position = Just { x = pX, y = pY }
                                            , spriteMinimap = Just gOSpMi
                                            , sprite = gOSp
                                            , collider = Maybe.Nothing
                                            , rotate = gORo
                                            , motion = Maybe.Nothing
                                            , physics = Maybe.Nothing
                                            }
                                    in
                                    Maybe.Nothing

                                _ ->
                                    Maybe.Nothing

                        _ ->
                            Maybe.Nothing

        _ ->
            Maybe.Nothing
