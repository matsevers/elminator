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
    , background = [ Objects.Tiles.Background.dust ]
    , gameObjects =
        Map.Generator.fill Objects.Tiles.Road.straight
            --Top/Down--
            [ Position { x = 64, y = 128 }
            , Position { x = 64, y = 192 }
            , Position { x = 64, y = 256 }
            , Position { x = 512, y = 320 }
            , Position { x = 512, y = 384 }
            , Position { x = 896, y = 128 }
            , Position { x = 896, y = 192 }
            , Position { x = 896, y = 256 }
            , Position { x = 896, y = 320 }
            , Position { x = 896, y = 384 }
            ]
            ++ Map.Generator.fill
                --Left/Right--
                (Map.Generator.rotate Objects.Tiles.Road.straight 90)
                [ Position { x = 128, y = 64 }
                , Position { x = 192, y = 64 }
                , Position { x = 256, y = 64 }
                , Position { x = 320, y = 64 }
                , Position { x = 384, y = 64 }
                , Position { x = 448, y = 64 }
                , Position { x = 512, y = 64 }
                , Position { x = 576, y = 64 }
                , Position { x = 640, y = 64 }
                , Position { x = 704, y = 64 }
                , Position { x = 768, y = 64 }
                , Position { x = 832, y = 64 }
                , Position { x = 192, y = 256 }
                , Position { x = 256, y = 256 }
                , Position { x = 320, y = 256 }
                , Position { x = 384, y = 256 }
                , Position { x = 448, y = 256 }
                , Position { x = 576, y = 448 }
                , Position { x = 640, y = 448 }
                , Position { x = 704, y = 448 }
                , Position { x = 768, y = 448 }
                , Position { x = 832, y = 448 }
                ]
            ++ Map.Generator.fill
                --Down/Right--
                (Map.Generator.rotate Objects.Tiles.Road.curveTopRight 90)
                [ Position { x = 64, y = 64 }
                , Position { x = 128, y = 256 }
                ]
            ++ Map.Generator.fill
                --Top/Right--
                (Map.Generator.rotate Objects.Tiles.Road.curveTopRight 0)
                [ Position { x = 64, y = 320 }, Position { x = 512, y = 448 } ]
            ++ Map.Generator.fill
                --Left/Top--
                (Map.Generator.rotate Objects.Tiles.Road.curveTopRight 270)
                [ Position { x = 128, y = 320 }
                , Position { x = 896, y = 448 }
                ]
            ++ Map.Generator.fill
                --Left/Down-
                (Map.Generator.rotate Objects.Tiles.Road.curveTopRight 180)
                [ Position { x = 512, y = 256 }
                , Position { x = 896, y = 64 }
                ]
    }
