module Objects.Tiles.Background exposing (dust)

import Objects.Physics exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


dust : GameObject
dust =
    { identifier = "BackgroundDust"
    , position = Nothing
    , collider = Nothing
    , sprite = "assets/background.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }
