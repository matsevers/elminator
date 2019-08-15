module Types exposing (Model, Msg(..), State(..))

import Control.Global exposing (..)
import Control.Player exposing (..)
import Map.Types exposing (..)


type Msg
    = KeyDown Action
    | KeyUp Action
    | Interval
    | None


type State
    = Menu
    | Paused
    | Finished
    | Stopping
    | Starting
    | Running


type alias Model =
    { state : State
    , map : Map.Types.Map Msg -- Records of Map
    , myPlayer : Player Msg
    , onlinePlayers : List (Player Msg)
    , lab : Int
    }
