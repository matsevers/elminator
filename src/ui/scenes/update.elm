module Ui.Scenes.Update exposing (update)

import Cmd.Extra exposing (..)
import Network.Module exposing (..)
import Types exposing (..)


update : Types.SceneMessage -> Model -> ( Model, Cmd Types.Msg )
update msg model =
    case msg of
        ChangeTo m s ->
            changeTo m s


changeTo : Model -> State -> ( Model, Cmd msg )
changeTo model state =
    { model | state = state } |> withNoCmd
