module Ui.Scenes.FinishMenu.Update exposing (restoreInitialModel, update)

import InitialModel
import Types


update : Types.FinishMenuMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    ( model, Cmd.none )


restoreInitialModel : Types.Model
restoreInitialModel =
    InitialModel.initialModel
