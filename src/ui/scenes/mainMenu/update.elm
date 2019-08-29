module Ui.Scenes.MainMenu.Update exposing (changeCar, changeMap, update)

import Types


update : Types.MainMenuMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        Types.ChangeCar _ gO ->
            changeCar model gO

        Types.ChangeMap _ m ->
            changeMap model m

        Types.ChangeName _ name ->
            changeName model name


changeCar : Types.Model -> Types.GameObject -> ( Types.Model, Cmd Types.Msg )
changeCar model gO =
    let
        myPlayer =
            model.myPlayer
    in
    ( { model | myPlayer = { myPlayer | controlledObject = gO } }, Cmd.none )


changeMap : Types.Model -> Types.Map -> ( Types.Model, Cmd Types.Msg )
changeMap model m =
    ( { model | map = m }, Cmd.none )


changeName : Types.Model -> String -> ( Types.Model, Cmd Types.Msg )
changeName model name =
    let
        myPlayer =
            model.myPlayer

        label =
            model.myPlayer.label
    in
    ( { model | myPlayer = { myPlayer | label = { label | text = name } } }, Cmd.none )
