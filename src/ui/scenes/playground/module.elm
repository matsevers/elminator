module Ui.Scenes.Playground.Module exposing
    ( update
    , view
    )

import Types
import Ui.Scenes.Playground.Update
import Ui.Scenes.Playground.View


update : Types.PlaygroundMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update =
    Ui.Scenes.Playground.Update.update


view =
    Ui.Scenes.Playground.View.view
