module Map.Track.DustRace exposing (model)

import Map.Generator
import Objects.Module
import Objects.Tiles.Background
import Objects.Tiles.Checkpoint
import Objects.Tiles.Decor
import Objects.Tiles.Road
import Types


model : Types.Map
model =
    let
        map =
            init

        gameObjects =
            init.gameObjects
    in
    { map
        | gameObjects =
            { gameObjects
                | background =
                    Map.Generator.fill
                        background
                        (Map.Generator.possibleTileCoords map)
            }
    }


init : Types.Map
init =
    { meta =
        { name = "Dust Race"
        , description = "The dirty one!"
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
        , prepareRaceTime = 3000
        }
    , gameObjects =
        { background = []
        , roads = roads
        , trigger = startLine :: finishLine :: checkBox
        , decor = decor
        }
    }


background : Types.GameObject
background =
    Objects.Tiles.Background.dust


startLine : Types.GameObject
startLine =
    Objects.Module.position
        (Just { x = 512, y = 65 })
        (Objects.Module.rotate 90 Objects.Tiles.Checkpoint.startLine)


finishLine : Types.GameObject
finishLine =
    Objects.Module.position
        (Just { x = 492, y = 65 })
        (Objects.Module.rotate 0 Objects.Tiles.Checkpoint.finishLine)


checkBox : List Types.GameObject
checkBox =
    [ Objects.Module.rotate
        180
        (Objects.Module.position (Just { x = 896, y = 64 })
            (Objects.Tiles.Checkpoint.checkBox "1")
        )
    , Objects.Module.rotate
        270
        (Objects.Module.position
            (Just { x = 896, y = 448 })
            (Objects.Tiles.Checkpoint.checkBox "2")
        )
    , Objects.Module.rotate
        0
        (Objects.Module.position
            (Just { x = 512, y = 448 })
            (Objects.Tiles.Checkpoint.checkBox "3")
        )
    , Objects.Module.rotate
        180
        (Objects.Module.position
            (Just { x = 512, y = 256 })
            (Objects.Tiles.Checkpoint.checkBox "4")
        )
    , Objects.Module.rotate
        0
        (Objects.Module.position
            (Just { x = 64, y = 320 })
            (Objects.Tiles.Checkpoint.checkBox "5")
        )
    , Objects.Module.rotate
        90
        (Objects.Module.position
            (Just { x = 64, y = 64 })
            (Objects.Tiles.Checkpoint.checkBox "6")
        )
    ]


decor : List Types.GameObject
decor =
    [ Objects.Module.position
        (Just { x = 448, y = 0 })
        Objects.Tiles.Decor.platformBlue
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


roads : List Types.GameObject
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
            (Objects.Module.rotate 90 Objects.Tiles.Road.straight)
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
            (Objects.Module.rotate 90 Objects.Tiles.Road.curveTopRight)
            [ { x = 64, y = 64 }
            , { x = 128, y = 256 }
            ]
        ++ Map.Generator.fill
            --Top/Right--
            (Objects.Module.rotate 0 Objects.Tiles.Road.curveTopRight)
            [ { x = 64, y = 320 }, { x = 512, y = 448 } ]
        ++ Map.Generator.fill
            --Left/Top--
            (Objects.Module.rotate 270 Objects.Tiles.Road.curveTopRight)
            [ { x = 128, y = 320 }
            , { x = 896, y = 448 }
            ]
        ++ Map.Generator.fill
            --Left/Down-
            (Objects.Module.rotate 180 Objects.Tiles.Road.curveTopRight)
            [ { x = 512, y = 256 }
            , { x = 896, y = 64 }
            ]
