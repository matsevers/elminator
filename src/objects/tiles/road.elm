module Objects.Tiles.Road exposing (curveTopRight, straight)

import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


straight : GameObject
straight =
    { identifier = "RoadStraight"
    , position = Nothing
    , collider = []
    , sprite = "assets/roadStraight.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


curveTopRight : GameObject
curveTopRight =
    { identifier = "RoadStraight"
    , position = Nothing
    , collider = []
    , sprite = "assets/roadCurve.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }
