module Objects.Types exposing (GameObject, Motion, Physics, Position(..), Size)

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
    { speed : Float
    , maxForwardSpeed : Float
    , maxBackwardSpeed : Float
    }


type alias Physics =
    { forceForward : Float
    , forceBackward : Float
    }


type alias GameObject msg =
    { identifier : String
    , size : Size
    , position : Position
    , sprite : String
    , collider : Svg msg
    , rotate : Int
    , motion : Motion
    , physics : Physics
    }
