module Ui.Scenes.Playground.Module exposing (update, view)

import Types exposing (..)
import Ui.Scenes.Playground.Update exposing (..)
import Ui.Scenes.Playground.View exposing (..)


update : PlaygroundMessage -> Model -> ( Model, Cmd Msg )
update =
    Ui.Scenes.Playground.Update.update


view =
    Ui.Scenes.Playground.View.view
