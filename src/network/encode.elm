module Network.Encode exposing (encodeLobby, encodePlayer)

import Json.Encode
import List
import Types


encodeLobby : Types.Lobby -> List ( String, Json.Encode.Value )
encodeLobby lobby =
    [ ( "identifier", Json.Encode.string lobby.identifier )
    , ( "name", Json.Encode.string lobby.name )
    , ( "maxPlayer", Json.Encode.int lobby.maxPlayer )
    , ( "currentPlayer", Json.Encode.int lobby.currentPlayer )
    , ( "map", Json.Encode.string lobby.map )
    ]


encodePlayer : Types.Player -> List ( String, Json.Encode.Value )
encodePlayer player =
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
    , ( "catchedCheckpoints", Json.Encode.int (List.length player.catchedCheckpoints) )
    , ( "gOIdentifier", Json.Encode.string gO.identifier )
    , ( "gOPositionX", Json.Encode.int gOPosition.x )
    , ( "gOPositionY", Json.Encode.int gOPosition.y )
    , ( "gOSprite", Json.Encode.string gO.sprite )
    , ( "gOSpriteMinimap", Json.Encode.string spriteMinimap )
    , ( "gORotate", Json.Encode.int gO.rotate )
    , ( "gOSizeHeight", Json.Encode.int gO.size.height )
    , ( "gOSizeWidth", Json.Encode.int gO.size.width )
    ]
