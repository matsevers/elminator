module Objects.Tiles.Checkpoint exposing (checkBox, finishLine, startLine)

import Types exposing (..)
import Objects.Trigger exposing (..)


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
                , triggerFunction = Just Objects.Trigger.startCheckpoint
                }
            )
    , sprite = ""
    , spriteMinimap = Maybe.Nothing
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
    , collider = Just
            (Rect
                { height = 64
                , width = 20
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "FinishLine"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Maybe.Nothing
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Just Objects.Trigger.endCheckpoint
                }
            )
    , sprite = "assets/decor/Finish.png"
    , spriteMinimap = Maybe.Nothing
    , size = { height = 64, width = 20 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


checkBox : String -> GameObject
checkBox identifier =
    { identifier = "checkbox-" ++ identifier
    , kind = Types.Checkpoint
    , position = Maybe.Nothing
    , collider = Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "checkbox-"++identifier
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Maybe.Nothing
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Just Objects.Trigger.catchCheckpoint
                }
            )
    , sprite = "assets/decor/checkbox.png"
    , spriteMinimap = Maybe.Nothing
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }
