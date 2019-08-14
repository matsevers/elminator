module Map.Types exposing (Map)

import Objects.Types exposing (GameObject, Position)


type alias Map msg =
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
        { background : GameObject msg
        , roads : List (GameObject msg)
        , checkPoints : List (GameObject msg)
        , startLine : GameObject msg
        , finishLine : GameObject msg
        , decor : List (GameObject msg)
        }
    }
