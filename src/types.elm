module Types exposing (Model, Msg(..), State(..))

import Control.Types exposing (..)
import Map.Types exposing (..)


type Msg
    = KeyEvent KeyEvent Action
    | Tick
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
    , frequence : Float
    , map : Map.Types.Map Msg -- Records of Map
    , myPlayer : Player Msg
    , onlinePlayers : List (Player Msg)
    , lab : Int
    }
