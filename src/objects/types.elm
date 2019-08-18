module Objects.Types exposing (Collider(..), GameObject, Impact(..), Motion, Physics, Position, Size)


type alias Position =
    { x : Int
    , y : Int
    }


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
    , impacts : List Impact
    }


type Collider
    = Rect
        { height : Int
        , width : Int
        , position : Maybe Position
        }
    | Circle
        { radiant : Int
        , position : Maybe Position
        }


type Impact
    = Impact
        { duration : Int
        , function : GameObject -> GameObject
        }


type alias GameObject =
    { identifier : String
    , size : Size
    , position : Maybe Position
    , sprite : String
    , collider : List Collider
    , rotate : Int
    , motion : Maybe Motion
    , physics : Maybe Physics
    }
