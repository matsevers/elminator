module InitialModel exposing (initialModel)

import Dict
import Map.Track.Module exposing (..)
import Objects.Vehicle.Module
import Types exposing (..)


frequence : Float
frequence =
    40


initialModel : Model
initialModel =
    { state = Menu
    , frequence = frequence
    , availableCars = Objects.Vehicle.Module.vehicles
    , availableMaps = Map.Track.Module.tracks
    , map = Map.Track.Module.defaultTrack
    , myPlayer =
        { identifier = "blue"
        , label =
            { text = "Unnamed Driver"
            , color = "#F3B1CF"
            , size = 40
            , visible = True
            }
        , assignedKeys =
            { forward = Types.W
            , backward = Types.S
            , left = Types.A
            , right = Types.D
            , action = Types.Space
            }
        , storedKeys =
            { forward = Types.Nothing
            , backward = Types.Nothing
            , left = Types.Nothing
            , right = Types.Nothing
            }
        , currentLab = 1
        , time = 0
        , controlledObject = Objects.Vehicle.Module.defaultVehicle
        , catchedCheckpoints = []
        }
    , onlinePlayers = []
    , lab = 0
    , debug = False
    , network =
        { lobbyPool = []
        , session = ""
        , multiplayer = False
        , webSocketConnected = False
        }
    , ownLobby =
        { identifier = "ownLobby"
        , maxPlayer = 2
        , onlinePlayers = []
        , map = "Dust Race"
        , ttl = frequence * 50 + 1
        , running = False
        }
    }
