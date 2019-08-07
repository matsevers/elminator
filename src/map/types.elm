module Map.Types exposing (Map)

import Objects.Types exposing (GameObject, Position)


type alias Map msg =
    { name : String
    , width : Int
    , height : Int
    , starter : Int
    , startPositions : List Position
    , background : List (GameObject msg)
    , gameObjects : List (GameObject msg)
    }
