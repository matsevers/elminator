module Objects.Tiles.Road exposing (curveTopRight, straight)

import Objects.Physics exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


straight : GameObject
straight =
    { identifier = "RoadStraight"
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
                            { trigger = "road"
                            , duration = 0
                            , overrideBackgroundImpact = True
                            , function = identity
                            }
                        )
                }
            )
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
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "road"
                            , duration = 0
                            , overrideBackgroundImpact = True
                            , function = identity
                            }
                        )
                }
            )
    , sprite = "assets/roadCurve.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }
