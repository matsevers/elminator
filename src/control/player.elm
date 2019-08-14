module Control.Player exposing (Keys, Player)

import Control.Global exposing (..)
import Objects.Types exposing (..)


type alias Keys =
    Control.Global.Keys


type alias Player msg =
    { identifier : String
    , assignedKeys :
        { forward : Keys
        , backward : Keys
        , left : Keys
        , right : Keys
        , action : Keys
        }
    , storedKeys :
        { forward : Action
        , backward : Action
        , left : Action
        , right : Action
        }
    , controlledObject : GameObject msg
    }
