module Ui.Scenes.Manager exposing (changeTo)

import Types exposing (Model, State(..))


changeTo : State -> Model -> ( Model, Cmd msg )
changeTo state model =
    ( { model | state = state }, Cmd.none )
