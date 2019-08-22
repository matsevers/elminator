module Types exposing (MainMenuMessage(..), Model, Msg(..), SceneMessage(..), State(..))

import Control.Types exposing (..)
import Map.Types exposing (..)
import Objects.Types exposing (..)


type Msg
    = ChangeScene State
    | MainMenu MainMenuMessage
    | SceneManager SceneMessage
    | Control Model KeyEvent Action
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



-- SCENE MESSAGES


type MainMenuMessage
    = ChangeCar Model GameObject
    | ChangeMap Model Map


type SceneMessage
    = ChangeTo Model State
