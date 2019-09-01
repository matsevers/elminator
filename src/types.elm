module Types exposing
    ( Action(..)
    , Args
    , Collider(..)
    , GameObject
    , Impact(..)
    , KeyEvent(..)
    , Keys(..)
    , Label
    , Lobby
    , LobbyControl
    , MainMenuMessage(..)
    , Map
    , Message
    , Model
    , Motion
    , Msg(..)
    , Network
    , ObjectType(..)
    , Physics
    , Player
    , PlaygroundMessage(..)
    , Position
    , SceneMessage(..)
    , SchemePlayer
    , Size
    , State(..)
    , UUIDType(..)
    , Websocketmsg(..)
    )

import Dict
import Json.Encode exposing (Value)
import UUID


type Msg
    = ChangeScene State
    | MainMenu MainMenuMessage
    | SceneManager SceneMessage
    | Playground PlaygroundMessage
    | Control Model KeyEvent Action
    | Tick
    | Websocket Websocketmsg
    | SetUUID UUIDType UUID.UUID
    | None


type Websocketmsg
    = Send String
    | Process Value
    | Receive Value


type State
    = Menu
    | Finished
    | Running
    | PrepareRace


type alias Model =
    { state : State
    , frequence : Float
    , availableMaps : List Map
    , availableCars : List GameObject
    , map : Map -- Records of Map
    , myPlayer : Player
    , onlinePlayers : List Player
    , lab : Int
    , debug : Bool
    , network : Network
    , ownLobby : Lobby
    }


type UUIDType
    = PlayerUUID
    | LobbyUUID



-- Objects Types


type alias Network =
    { lobbyPool : List Lobby
    , session : String
    , multiplayer : Bool
    , webSocketConnected : Bool
    }


type ObjectType
    = Trigger
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
    | MoreFollow


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



-- Lobby Types


type alias Lobby =
    { identifier : String
    , maxPlayer : Int
    , map : String
    , onlinePlayers : List String
    , ttl : Float
    }



-- Websocket Type


type alias Args =
    { message : Message
    , key : String
    }


type alias Message =
    { lobby : Maybe Lobby
    , player : Maybe SchemePlayer
    , lobbyControl : Maybe LobbyControl
    }


type alias LobbyControl =
    { identifier : String
    , playerId : String
    , join : Bool
    , start : Bool
    , finish : Bool
    , leave : Bool
    }


type alias SchemePlayer =
    { identifier : String
    , label : String
    , labelCol : String
    , labelSize : Int
    , labelVisible : Bool
    , currentLab : Int
    , time : Int
    , catchedCheckpoints : Int
    , gOIdentifier : String
    , gOPositionX : Int
    , gOPositionY : Int
    , gOSprite : String
    , gOSpriteMinimap : String
    , gORotate : Int
    , gOSizeHeight : Int
    , gOSizeWidth : Int
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
    , currentLab : Int
    , controlledObject : GameObject
    , catchedCheckpoints : List GameObject
    , label : Label
    , time : Int
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
        , prepareRaceTime : Float
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
    | ChangeName Model String
    | ChangePlayerCount Model String
    | ChangeGameType Model
    | JoinLobby Model Lobby
    | LeaveLobby Model Lobby


type SceneMessage
    = ChangeTo Model State


type PlaygroundMessage
    = NoPlaygroundMessage
    | ChangeColliderVisibility Model
