module Objects.Tiles.Road exposing (curveTopRight, straight)

import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


straight : GameObject
straight =
    { identifier = "RoadStraight"
    , position = PositionUnset
    , collider = [ ColliderUnset ]
    , sprite = "assets/roadStraight.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


curveTopRight : GameObject
curveTopRight =
    { identifier = "RoadStraight"
    , position = PositionUnset
    , collider = [ ColliderUnset ]
    , sprite = "assets/roadCurve.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }
