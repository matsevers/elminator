module Ui.Scenes.Playground.Update exposing (update)

import Types


update : Types.PlaygroundMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        Types.ChangeColliderVisibility m ->
            ( { model | debug = not m.debug }, Cmd.none )

        _ ->
            ( model, Cmd.none )
