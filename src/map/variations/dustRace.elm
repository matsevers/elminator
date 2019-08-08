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
    , background = [ Objects.Tiles.Background.dust None ]
    , gameObjects =
        Map.Generator.fill
            (Objects.Tiles.Road.straight
                None
            )
            [ Position { x = 64, y = 128 }, Position { x = 64, y = 192 }, Position { x = 64, y = 256 } ]
            ++ [ Map.Generator.rotate (Objects.Tiles.Road.curveTopRight (Position { x = 64, y = 320 })) 90
               ]
    }
