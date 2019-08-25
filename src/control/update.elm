module Control.Update exposing (update)

import Control.Player exposing (..)
import Types exposing (..)


update : KeyEvent -> Action -> Model -> ( Model, Cmd Types.Msg )
update event action model =
    Control.Player.applyInput model event action
