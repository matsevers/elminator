module Network.Scheme exposing (encode)

import Json.Encode exposing (..)
import Types exposing (..)


encode : Player -> List ( String, Json.Encode.Value )
encode player =
    [ ( "identifier", string player.identifier )
    , ( "lab", int player.currentLab )
    ]
