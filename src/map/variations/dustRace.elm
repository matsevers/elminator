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
    let
        map =
            init

        gameObjects =
            init.gameObjects
    in
    { map | gameObjects = { gameObjects | background = fill background (possibleTileCoords map) } }


init : Map.Types.Map
init =
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
        , startPositions = [ { x = 448, y = 128 } ]
        }
    , gameObjects =
        { background = []
        , roads = roads
        , trigger = []
        , startLine = startLine
        , finishLine = finishLine
        , decor = decor
        }
    }


background : GameObject
background =
    Objects.Tiles.Background.dust


startLine : GameObject
startLine =
    Objects.Manager.position (Just { x = 512, y = 84 }) (Objects.Manager.rotate 90 Objects.Tiles.Decor.startLine)


finishLine : GameObject
finishLine =
    Objects.Manager.position (Just { x = 512, y = 65 }) (Objects.Manager.rotate 0 Objects.Tiles.Decor.finishLine)


decor : List GameObject
decor =
    [ Objects.Manager.position (Just { x = 448, y = 0 }) Objects.Tiles.Decor.platformBlue
    ]
        ++ Map.Generator.fill Objects.Tiles.Decor.bush1
            [ { x = 384, y = 0 }
            , { x = 590, y = 0 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.bush2
            [ { x = 448, y = 320 }
            , { x = 576, y = 384 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.rock1
            [ { x = 858, y = 416 }
            , { x = 138, y = 138 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.rock2
            [ { x = 138, y = 224 }
            ]
        ++ Map.Generator.fill Objects.Tiles.Decor.tree2
            [ { x = 32, y = 365 }
            , { x = 96, y = 390 }
            , { x = 160, y = 370 }
            , { x = 0, y = 250 }
            , { x = 0, y = 310 }
            , { x = 192, y = 320 }
            ]


roads : List GameObject
roads =
    Map.Generator.fill Objects.Tiles.Road.straight
        --Top/Down--
        [ { x = 64, y = 128 }
        , { x = 64, y = 192 }
        , { x = 64, y = 256 }
        , { x = 512, y = 320 }
        , { x = 512, y = 384 }
        , { x = 896, y = 128 }
        , { x = 896, y = 192 }
        , { x = 896, y = 256 }
        , { x = 896, y = 320 }
        , { x = 896, y = 384 }
        ]
        ++ Map.Generator.fill
            --Left/Right--
            (Objects.Manager.rotate 90 Objects.Tiles.Road.straight)
            [ { x = 128, y = 64 }
            , { x = 192, y = 64 }
            , { x = 256, y = 64 }
            , { x = 320, y = 64 }
            , { x = 384, y = 64 }
            , { x = 448, y = 64 }
            , { x = 512, y = 64 }
            , { x = 576, y = 64 }
            , { x = 640, y = 64 }
            , { x = 704, y = 64 }
            , { x = 768, y = 64 }
            , { x = 832, y = 64 }
            , { x = 192, y = 256 }
            , { x = 256, y = 256 }
            , { x = 320, y = 256 }
            , { x = 384, y = 256 }
            , { x = 448, y = 256 }
            , { x = 576, y = 448 }
            , { x = 640, y = 448 }
            , { x = 704, y = 448 }
            , { x = 768, y = 448 }
            , { x = 832, y = 448 }
            ]
        ++ Map.Generator.fill
            --Down/Right--
            (Objects.Manager.rotate 90 Objects.Tiles.Road.curveTopRight)
            [ { x = 64, y = 64 }
            , { x = 128, y = 256 }
            ]
        ++ Map.Generator.fill
            --Top/Right--
            (Objects.Manager.rotate 0 Objects.Tiles.Road.curveTopRight)
            [ { x = 64, y = 320 }, { x = 512, y = 448 } ]
        ++ Map.Generator.fill
            --Left/Top--
            (Objects.Manager.rotate 270 Objects.Tiles.Road.curveTopRight)
            [ { x = 128, y = 320 }
            , { x = 896, y = 448 }
            ]
        ++ Map.Generator.fill
            --Left/Down-
            (Objects.Manager.rotate 180 Objects.Tiles.Road.curveTopRight)
            [ { x = 512, y = 256 }
            , { x = 896, y = 64 }
            ]
