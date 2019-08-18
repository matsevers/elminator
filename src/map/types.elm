module Map.Types exposing (Map)

import Objects.Types exposing (GameObject, Position)


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
        , startLine : GameObject
        , finishLine : GameObject
        , decor : List GameObject
        }
    }
