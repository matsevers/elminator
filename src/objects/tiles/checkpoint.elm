module Objects.Tiles.Checkpoint exposing (finishLine, startLine)

import Objects.Types exposing (..)


startLine : GameObject
startLine =
    { identifier = "StartLine"
    , kind = Objects.Types.Checkpoint
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 20
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "StartLine"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Nothing
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                }
            )
    , sprite = ""
    , size = { height = 64, width = 20 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


finishLine : GameObject
finishLine =
    { identifier = "FinishLine"
    , kind = Objects.Types.Checkpoint
    , position = Nothing
    , collider = Nothing
    , sprite = "assets/decor/Finish.png"
    , size = { height = 64, width = 20 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }
