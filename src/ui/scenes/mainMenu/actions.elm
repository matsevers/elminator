module Ui.Scenes.MainMenu.Actions exposing (changeCar, changeMap)

import Map.Types exposing (..)
import Objects.Types exposing (..)
import Types exposing (..)


changeCar : Model -> GameObject -> ( Model, Cmd Msg )
changeCar model gO =
    let
        myPlayer =
            model.myPlayer
    in
    ( { model | myPlayer = { myPlayer | controlledObject = gO } }, Cmd.none )


changeMap : Model -> Map -> ( Model, Cmd Msg )
changeMap model m =
    ( { model | map = m }, Cmd.none )
