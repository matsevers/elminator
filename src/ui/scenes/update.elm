module Ui.Scenes.Update exposing (update)

import Cmd.Extra
import Types


update : Types.SceneMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        Types.ChangeTo m s ->
            changeTo m s


changeTo : Types.Model -> Types.State -> ( Types.Model, Cmd msg )
changeTo model state =
    { model | state = state } |> Cmd.Extra.withNoCmd
