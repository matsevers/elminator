module Objects.Types exposing (GameObject, Position, Size)

import Svg exposing (..)


type alias Position =
    { x : Int
    , y : Int
    }


type alias Size =
    { height : Int
    , width : Int
    }


type alias GameObject msg =
    { identifier : String
    , size : Size
    , position : Position
    , sprite : String
    , collider : Svg msg
    , rotate : Int
    , speed : Int
    }
