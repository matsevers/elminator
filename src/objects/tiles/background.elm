module Objects.Tiles.Background exposing (dust)

import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


dust : GameObject
dust =
    { identifier = "BackgroundDust"
    , position = PositionUnset
    , collider = [ ColliderUnset ]
    , sprite = "assets/background.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }
