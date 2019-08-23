module Objects.Types exposing (Collider(..), GameObject, Impact(..), Motion, ObjectType(..), Physics, Position, Size)


type ObjectType
    = Event
    | Checkpoint
    | Car
    | Background
    | Road
    | Decor


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
        , position : Position
        , impactFunction : Maybe Impact
        }
    | Circle
        { radiant : Int
        , position : Position
        , impactFunction : Maybe Impact
        }


type Impact
    = Impact
        { trigger : String
        , overrideBackgroundImpact : Bool
        , duration : Float
        , function : Maybe (Impact -> GameObject -> GameObject)
        , unmodifiedObject : Maybe GameObject
        }


type alias GameObject =
    { identifier : String
    , kind : ObjectType
    , size : Size
    , position : Maybe Position
    , sprite : String
    , collider : Maybe Collider
    , rotate : Int
    , motion : Maybe Motion
    , physics : Maybe Physics
    }
