module Objects.Physics.Types exposing (Collider(..), Impact(..), Physics)

import Objects.Types exposing (..)


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
        , function : GameObject -> GameObject
        }
