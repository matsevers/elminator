module Objects.Tiles.Background exposing (dust)

import Objects.Physics exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


dust : GameObject
dust =
    { identifier = "BackgroundDust"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "background"
                            , duration = 100
                            , function = Objects.Physics.slowDown
                            }
                        )
                }
            )
    , sprite = "assets/background.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }
