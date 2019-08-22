module Ui.Scenes.MainMenu.Module exposing (update, view)

import Types exposing (..)
import Ui.Scenes.MainMenu.Update
import Ui.Scenes.MainMenu.View exposing (..)


view =
    Ui.Scenes.MainMenu.View.view


update : MainMenuMessage -> Model -> ( Model, Cmd Msg )
update msg model =
    Ui.Scenes.MainMenu.Update.update msg model
