module Objects.Trigger exposing (..)

import Types exposing (..)


handleTrigger : (GameObject -> Model -> Model) -> GameObject -> Model -> Model
handleTrigger f =
    f


catchCheckpoint : GameObject -> Model -> Model
catchCheckpoint gO m =
    m