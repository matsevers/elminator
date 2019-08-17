module Map.Variations.DustRace exposing (model)

import Map.Generator exposing (..)
import Map.Types exposing (..)
import Objects.Manager exposing (..)
import Objects.Tiles.Background exposing (..)
import Objects.Tiles.Decor exposing (..)
import Objects.Tiles.Road exposing (..)
import Objects.Types exposing (..)


model : Map.Types.Map
model =
    { meta =
        { name = "Dust Race"
        , description = "Es wird staubig!"
        }
    , dimension =
        { width = 16
        , height = 8
        , tileSize = 64
        , viewScale = 2
        }
    , options =
        { starter = 1
        , labs = 2
        , startPositions = [ Position { x = 448, y = 128 } ]
        }
    , gameObjects =
        { background = Objects.Tiles.Background.dust
        , roads = roads
        , checkPoints = []
        , startLine = startLine
        , finishLine = finishLine
        , decor = decor
        }
    }


startLine : GameObject
startLine =
    Objects.Manager.position (Position { x = 512, y = 84 }) (Objects.Manager.rotate 90 Objects.Tiles.Decor.startLine)


finishLine : GameObject
finishLine =
    Objects.Manager.position (Position { x = 512, y = 84 }) (Objects.Manager.rotate 90 Objects.Tiles.Decor.finishLine)


decor : List GameObject
decor =
    [ Objects.Manager.position (Position { x = 448, y = 0 }) Objects.Tiles.Decor.platformBlue
    ]
        ++ Map.Generator.fill Objects.Tiles.Decor.bush1
            [ Position { x = 384, y = 0 }
            , Position { x = 590, y = 0 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.bush2
            [ Position { x = 448, y = 320 }
            , Position { x = 576, y = 384 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.rock1
            [ Position { x = 858, y = 416 }
            , Position { x = 138, y = 138 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.rock2
            [ Position { x = 138, y = 224 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.tree2
            [ Position { x = 32, y = 365 }
            , Position { x = 96, y = 390 }
            , Position { x = 160, y = 370 }
            , Position { x = 0, y = 250 }
            , Position { x = 0, y = 310 }
            , Position { x = 192, y = 320 }
            ]


roads : List GameObject
roads =
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
            (Objects.Manager.rotate 90 Objects.Tiles.Road.straight)
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
            (Objects.Manager.rotate 90 Objects.Tiles.Road.curveTopRight)
            [ Position { x = 64, y = 64 }
            , Position { x = 128, y = 256 }
            ]
        ++ Map.Generator.fill
            --Top/Right--
            (Objects.Manager.rotate 0 Objects.Tiles.Road.curveTopRight)
            [ Position { x = 64, y = 320 }, Position { x = 512, y = 448 } ]
        ++ Map.Generator.fill
            --Left/Top--
            (Objects.Manager.rotate 270 Objects.Tiles.Road.curveTopRight)
            [ Position { x = 128, y = 320 }
            , Position { x = 896, y = 448 }
            ]
        ++ Map.Generator.fill
            --Left/Down-
            (Objects.Manager.rotate 180 Objects.Tiles.Road.curveTopRight)
            [ Position { x = 512, y = 256 }
            , Position { x = 896, y = 64 }
            ]
