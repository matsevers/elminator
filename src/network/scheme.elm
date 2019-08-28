module Network.Scheme exposing (decode, encode)

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
    , ( "labelCol", Json.Encode.string player.label.color )
    , ( "labelSize", Json.Encode.int player.label.size )
    , ( "labelVisible", Json.Encode.bool player.label.visible )
    , ( "currentLab", Json.Encode.int player.currentLab )
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
    { message : String
    , key : String
    }


type alias Message =
    { identifier : String
    , label : String
    , labelCol : String
    , labelSize : Int
    , labelVisible : Bool
    , currentLab : Int
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



{- messageDecoder : Decoder Message
   messageDecoder =
       Json.Decode.map2 Message
           (Json.Decode.map8
               Message
               (Json.Decode.field "identifier" Json.Decode.string)
               (Json.Decode.field "label" Json.Decode.string)
               (Json.Decode.field "labelCol" Json.Decode.string)
               (Json.Decode.field "labelSize" Json.Decode.int)
               (Json.Decode.field "labelVisible" Json.Decode.bool)
               (Json.Decode.field "currentLab" Json.Decode.int)
               (Json.Decode.field "catchedCheckpoints" Json.Decode.int)
               (Json.Decode.field "gOIdentifier" Json.Decode.string)
           )
           (Json.Decode.map7 Message
               (Json.Decode.field "gOPositionX" Json.Decode.int)
               (Json.Decode.field "gOPositionY" Json.Decode.int)
               (Json.Decode.field "gOSprite" Json.Decode.string)
               (Json.Decode.field "gOSpriteMinimap" Json.Decode.string)
               (Json.Decode.field "gORotate" Json.Decode.int)
               (Json.Decode.field "gOSizeHeight" Json.Decode.int)
               (Json.Decode.field "gOSizeWidth" Json.Decode.int)
           )
-}


argsDecoder : Decoder Args
argsDecoder =
    Json.Decode.map2
        Args
        (Json.Decode.field "message" Json.Decode.string)
        (Json.Decode.field "key" Json.Decode.string)


decode : String -> Maybe Player
decode json =
    let
        j =
            Debug.log "JSON " json

        message =
            Debug.log "MSG " (Json.Decode.decodeString (field "args" argsDecoder) json)

        {-
           identifier =
               Json.Decode.decodeString (field "identifier" Json.Decode.string) message

           label =
               Json.Decode.decodeString (field "label" Json.Decode.string) message

           labelCol =
               Json.Decode.decodeString (field "labelCol" Json.Decode.string) message

           labelSize =
               Json.Decode.decodeString (field "labelSize" Json.Decode.int) message

           labelVisible =
               Json.Decode.decodeString (field "labelVisible" Json.Decode.bool) message

           currentLab =
               Json.Decode.decodeString (field "currentLab" Json.Decode.int) message

           gOIdentifier =
               Json.Decode.decodeString (field "gOIdentifier" Json.Decode.string) message

           catchedCheckpoints =
               Json.Decode.decodeString (field "catchedCheckpoints" Json.Decode.int) message

           gOPositionX =
               Json.Decode.decodeString (field "gOPositionX" Json.Decode.int) message

           gOPositionY =
               Json.Decode.decodeString (field "gOPositionY" Json.Decode.int) message

           gOSprite =
               Json.Decode.decodeString (field "gOSprite" Json.Decode.string) message

           gOSpriteMinimap =
               Json.Decode.decodeString (field "gOSpriteMinimap" Json.Decode.string) message

           gORotate =
               Json.Decode.decodeString (field "gORotate" Json.Decode.int) message

           gOSizeHeight =
               Json.Decode.decodeString (field "gOSizeHeight" Json.Decode.int) message

           gOSizeWidth =
               Json.Decode.decodeString (field "gOSizeWidth" Json.Decode.int) message

           l =
               Debug.log "id" identifier
        -}
    in
    Maybe.Nothing



{- case ( identifier, label, currentLab ) of
   ( Ok id, Ok la, Ok cL ) ->
       case ( gOIdentifier, catchedCheckpoints, gOPositionX ) of
           ( Ok gOId, Ok cC, Ok pX ) ->
               case ( gOPositionY, gOSprite, gOSpriteMinimap ) of
                   ( Ok pY, Ok gOSp, Ok gOSpMi ) ->
                       case ( gORotate, gOSizeHeight, gOSizeWidth ) of
                           ( Ok gORo, Ok gOSiHe, Ok gOSoWi ) ->
                               case ( labelCol, labelSize, labelVisible ) of
                                   ( Ok lC, Ok lS, Ok lV ) ->
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

                                           player =
                                               { identifier = id
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
                                               , currentLab = cL
                                               , controlledObject = gameObject
                                               , catchedCheckpoints = []
                                               , label = { text = la, color = lC, size = lS, visible = lV }
                                               }
                                       in
                                       Just player

                                   _ ->
                                       Debug.log "ERROR 1:" Maybe.Nothing

                           _ ->
                               Debug.log "ERROR 2:" Maybe.Nothing

                   _ ->
                       Debug.log "ERROR 3:" Maybe.Nothing

           _ ->
               Debug.log "ERROR 4:" Maybe.Nothing

   _ ->
       Debug.log "ERROR 5:" Maybe.Nothing
-}
