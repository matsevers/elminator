module Map.Variations.DustRace exposing (model)

import Map.Generator exposing (..)
import Map.Types exposing (..)
import Objects.Tiles.Background exposing (..)


model : Map.Types.Map msg
model =
    { name = "Dust Race"
    , width = 20
    , height = 10
    , starter = 1
    , startPositions = []
    , background = [ Objects.Tiles.Background.dust { x = 0, y = 0 } ]
    , gameObjects = []
    }
