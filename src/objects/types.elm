module Objects.Types exposing (Collider(..), GameObject, Motion, Physics, Position(..), Size)

import Svg exposing (..)


type Position
    = Position
        { x : Int
        , y : Int
        }
    | PositionUnset


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


type Collider
    = Rect
        { height : Int
        , width : Int
        , position : Position
        }
    | Circle
        { radiant : Int
        , position : Position
        }
    | ColliderUnset


type alias Impact =
    { duration : Int
    , function : GameObject -> GameObject
    }


type alias GameObject =
    { identifier : String
    , size : Size
    , position : Position
    , sprite : String
    , collider : List Collider
    , rotate : Int
    , motion : Motion
    , physics : Physics
    }
