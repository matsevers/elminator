module Types exposing (Model, Msg(..), State(..))

import Control.Types exposing (..)
import Map.Types exposing (..)


type Msg
    = KeyEvent KeyEvent Action
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
