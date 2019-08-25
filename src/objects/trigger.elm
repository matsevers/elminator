module Objects.Trigger exposing (..)

import Types exposing (..)


runTrigger : (GameObject -> Model -> Model) -> GameObject -> Model -> Model
runTrigger f =
    f


catchCheckpoint : GameObject -> Model -> Model
catchCheckpoint gO m =
    m