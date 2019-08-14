module Objects.Types exposing (GameObject, Motion, Position(..), Size)

import Svg exposing (..)


type Position
    = Position
        { x : Int
        , y : Int
        }
    | None


type alias Size =
    { height : Int
    , width : Int
    }


type alias Motion =
    { speed : Int
    , maxForwardSpeed : Int
    , maxBackwardSpeed : Int
    }


type alias GameObject msg =
    { identifier : String
    , size : Size
    , position : Position
    , sprite : String
    , collider : Svg msg
    , rotate : Int
    , motion : Motion
    }
