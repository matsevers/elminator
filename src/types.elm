module Types exposing (Model, Msg(..), State(..))

import Control.Types exposing (..)
import Map.Types exposing (..)
import Objects.Types exposing (..)


type Msg
    = KeyEvent KeyEvent Action
    | ChangeScene State
    | ChangeMap Map
    | ChangeCar GameObject
    | Tick
    | None


type State
    = Menu
    | Finished
    | Running


type alias Model =
    { state : State
    , frequence : Float
    , availableMaps : List Map.Types.Map
    , availableCars : List Objects.Types.GameObject
    , map : Map.Types.Map -- Records of Map
    , myPlayer : Player
    , onlinePlayers : List Player
    , lab : Int
    }
