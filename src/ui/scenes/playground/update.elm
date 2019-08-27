module Ui.Scenes.Playground.Update exposing (update)

import Types exposing (..)


update : Types.PlaygroundMessage -> Model -> ( Model, Cmd Types.Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )
