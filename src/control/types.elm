module Control.Types exposing (Action(..), KeyEvent(..), Keys(..), Player)

import Objects.Types exposing (GameObject)


type Keys
    = W
    | A
    | S
    | D
    | Space
    | Other


type Action
    = Forward
    | Backward
    | Left
    | Right
    | Nothing


type KeyEvent
    = Pressed
    | Released


type alias Player msg =
    { name : String
    , identifier : String
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
