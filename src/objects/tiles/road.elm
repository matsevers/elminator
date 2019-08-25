module Objects.Tiles.Road exposing (curveTopRight, straight)

import Objects.Physics exposing (..)
import Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


straight : GameObject
straight =
    { identifier = "RoadStraight"
    , kind = Types.Road
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "road"
                            , duration = 0
                            , overrideBackgroundImpact = True
                            , function = Maybe.Nothing
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                 , triggerFunction = Maybe.Nothing       
                }
            )
    , sprite = "assets/roadStraight.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


curveTopRight : GameObject
curveTopRight =
    { identifier = "RoadStraight"
    , kind = Types.Road
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "road"
                            , duration = 0
                            , overrideBackgroundImpact = True
                            , function = Maybe.Nothing
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing        
                }
            )
    , sprite = "assets/roadCurve.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }
