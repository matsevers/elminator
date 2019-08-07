module Objects.Tiles.Background exposing (dust)

import Objects.Manager exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


dust : Position -> GameObject msg
dust position =
    { identifier = "BackgroundDust"
    , position = position
    , collider = Svg.rect [] []
    , sprite = "assets/background.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , speed = 0
    }
