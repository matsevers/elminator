module Ui.Scenes.MainMenu.Update exposing (changeCar, changeMap, update)

import Types exposing (..)


update : Types.MainMenuMessage -> Model -> ( Model, Cmd Types.Msg )
update msg model =
    case msg of
        ChangeCar _ gO ->
            changeCar model gO

        ChangeMap _ m ->
            changeMap model m


changeCar : Model -> GameObject -> ( Model, Cmd Types.Msg )
changeCar model gO =
    let
        myPlayer =
            model.myPlayer
    in
    ( { model | myPlayer = { myPlayer | controlledObject = gO } }, Cmd.none )


changeMap : Model -> Map -> ( Model, Cmd Types.Msg )
changeMap model m =
    ( { model | map = m }, Cmd.none )
