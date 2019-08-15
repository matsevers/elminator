module Control.Player exposing (applyInput)

import Control.Global exposing (..)
import Control.Types exposing (..)
import Objects.Types exposing (..)
import Types exposing (..)


applyInput : Model -> KeyEvent -> Action -> ( Model, Cmd Msg )
applyInput model event action =
    let
        myPlayer =
            model.myPlayer

        storedKeys =
            myPlayer.storedKeys
    in
    case event of
        Pressed ->
            case action of
                Forward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | forward = action } } }, Cmd.none )

                Backward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | backward = action } } }, Cmd.none )

                Left ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | left = action } } }, Cmd.none )

                Right ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | right = action } } }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        Released ->
            case action of
                Forward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | forward = Control.Types.Nothing } } }, Cmd.none )

                Backward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | backward = Control.Types.Nothing } } }, Cmd.none )

                Left ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | left = Control.Types.Nothing } } }, Cmd.none )

                Right ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | right = Control.Types.Nothing } } }, Cmd.none )

                _ ->
                    ( model, Cmd.none )
