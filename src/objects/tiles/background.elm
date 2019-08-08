module Objects.Tiles.Background exposing (dust)

import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


dust : GameObject msg
dust =
    { identifier = "BackgroundDust"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/background.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , speed = 0
    }
