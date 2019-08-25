module Objects.Trigger exposing (..)

import Types exposing (..)


runTrigger : GameObject -> List (GameObject) -> Model -> Model
runTrigger gO l m =
    case l of
        x :: xs -> case x.collider of 
                        Just collider -> case collider of 
                                            Rect r -> case r.triggerFunction of 
                                                        Just f -> f x m
                                                        Maybe.Nothing -> runTrigger gO xs m
                                            _ -> runTrigger gO xs m
                        Maybe.Nothing -> runTrigger gO xs m

        [] -> m



-- functions for GameObjects.collider

startCheckpoint : GameObject -> Model -> Model
startCheckpoint gO m =
    m 

endCheckpoint : GameObject -> Model -> Model
endCheckpoint gO m =
    m 

catchCheckpoint : GameObject -> Model -> Model
catchCheckpoint gO m =
    m