module Ui.Scenes.Module exposing (update)

import Types exposing (..)
import Ui.Scenes.Update


update : SceneMessage -> Model -> ( Model, Cmd Msg )
update msg model =
    Ui.Scenes.Update.update msg model
