module Objects.Tiles.Checkpoint exposing (finishLine, startLine)

import Types exposing (..)


startLine : GameObject
startLine =
    { identifier = "StartLine"
    , kind = Types.Checkpoint
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 20
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "StartLine"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Maybe.Nothing
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing
                }
            )
    , sprite = ""
    , size = { height = 64, width = 20 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


finishLine : GameObject
finishLine =
    { identifier = "FinishLine"
    , kind = Types.Checkpoint
    , position = Maybe.Nothing
    , collider = Maybe.Nothing
    , sprite = "assets/decor/Finish.png"
    , size = { height = 64, width = 20 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }
