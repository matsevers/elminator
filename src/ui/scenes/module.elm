module Ui.Scenes.Module exposing (update)

import Types
import Ui.Scenes.Update


update : Types.SceneMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    Ui.Scenes.Update.update msg model
