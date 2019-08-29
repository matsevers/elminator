module Ui.Scenes.MainMenu.Module exposing (update, view)

import Types
import Ui.Scenes.MainMenu.Update
import Ui.Scenes.MainMenu.View


view =
    Ui.Scenes.MainMenu.View.view


update : Types.MainMenuMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update =
    Ui.Scenes.MainMenu.Update.update
