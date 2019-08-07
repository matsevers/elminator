module Objects.Tiles.Road exposing (straight)

import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


straight : Position -> GameObject msg
straight position =
    { identifier = "RoadStraight"
    , position = position
    , collider = Svg.rect [] []
    , sprite = "assets/roadStraight.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , speed = 0
    }
