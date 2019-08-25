module Objects.Tiles.Background exposing (dust, grass)

import Objects.Physics exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)


dust : GameObject
dust =
    { identifier = "BackgroundDust"
    , kind = Types.Background
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
                            { identifier = "background"
                            , duration = 0
                            , overrideBackgroundImpact = False
                            , function = Just Objects.Physics.slowDown
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing
                }
            )
    , sprite = "assets/background.png"
    , spriteMinimap = Maybe.Nothing
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


grass : GameObject
grass =
    { identifier = "BackgroundGrass"
    , kind = Types.Background
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
                            { identifier = "background"
                            , duration = 0
                            , overrideBackgroundImpact = False
                            , function = Just Objects.Physics.slowDown
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing
                }
            )
    , sprite = "assets/backgroundGrass.png"
    , spriteMinimap = Maybe.Nothing
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }
