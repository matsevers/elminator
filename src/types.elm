module Types exposing (Action(..), Collider(..), GameObject, Impact(..), KeyEvent(..), Keys(..), MainMenuMessage(..), Map, Model, Motion, Msg(..), ObjectType(..), Physics, Player, Position, SceneMessage(..), Size, State(..))


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
    , availableMaps : List Map
    , availableCars : List GameObject
    , map : Map -- Records of Map
    , myPlayer : Player
    , onlinePlayers : List Player
    , lab : Int
    }



-- Objects Types


type ObjectType
    = Event
    | Checkpoint
    | Car
    | Background
    | Road
    | Decor


type alias Position =
    { x : Int
    , y : Int
    }


type alias Size =
    { height : Int
    , width : Int
    }


type alias Motion =
    { speed : Float
    , maxForwardSpeed : Float
    , maxBackwardSpeed : Float
    }


type alias Physics =
    { forceForward : Float
    , forceBackward : Float
    , impacts : List Impact
    }


type Collider
    = Rect
        { height : Int
        , width : Int
        , position : Position
        , impactFunction : Maybe Impact
        , triggerFunction : Maybe (GameObject -> Model -> Model)
        }
    | Circle
        { radiant : Int
        , position : Position
        , impactFunction : Maybe Impact
        }


type Impact
    = Impact
        { identifier : String
        , overrideBackgroundImpact : Bool
        , duration : Float
        , function : Maybe (Impact -> GameObject -> GameObject)
        , unmodifiedObject : Maybe GameObject
        }


type alias GameObject =
    { identifier : String
    , kind : ObjectType
    , size : Size
    , position : Maybe Position
    , spriteMinimap : Maybe String
    , sprite : String
    , collider : Maybe Collider
    , rotate : Int
    , motion : Maybe Motion
    , physics : Maybe Physics
    }



-- Control Types


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


type alias Player =
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
    , controlledObject : GameObject
    , requiredCheckPoints : List GameObject
    , snatchedCheckPoints : List GameObject
    , label : Maybe Label
    }


type alias Label =
    { text : String, color : String, size : Int, visible : Bool }



-- Map Types


type alias Map =
    { meta :
        { name : String
        , description : String
        }
    , dimension :
        { width : Int
        , height : Int
        , tileSize : Int
        , viewScale : Float
        }
    , options :
        { starter : Int
        , labs : Int
        , startPositions : List Position
        }
    , gameObjects :
        { background : List GameObject
        , roads : List GameObject
        , trigger : List GameObject
        , decor : List GameObject
        }
    }



-- SCENE MESSAGES


type MainMenuMessage
    = ChangeCar Model GameObject
    | ChangeMap Model Map


type SceneMessage
    = ChangeTo Model State
