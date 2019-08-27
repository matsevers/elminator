module Network.Scheme exposing (encode)

import Json.Encode exposing (..)
import Types exposing (..)


encode : Player -> List ( String, Json.Encode.Value )
encode player =
    Debug.log "scheme"
        [ ( "identifier", string player.identifier )
        , ( "label", string player.label.text )
        , ( "lab", int player.currentLab )
        ]
