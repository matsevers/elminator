module Map.Variations.DustRace exposing (model)

import Map.Generator exposing (..)
import Map.Types exposing (..)
import Objects.Tiles.Background exposing (..)
import Objects.Tiles.Road exposing (..)
import Objects.Types exposing (..)


model : Map.Types.Map msg
model =
    { name = "Dust Race"
    , width = 20
    , height = 10
    , starter = 1
    , tileSize = 64
    , startPositions = []
    , background = [ Objects.Tiles.Background.dust { x = 0, y = 0 } ]
    , gameObjects = [ Objects.Tiles.Road.straight { x = 100, y = 0 } ]
    }
