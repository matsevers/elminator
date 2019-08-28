module Control.Update exposing (update)

import Control.Player
import Json.Decode exposing (..)
import Types


update : Types.KeyEvent -> Types.Action -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update event action model =
    Control.Player.applyInput model event action
