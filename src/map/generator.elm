module Map.Generator exposing (fill, map, possibleTileCoords)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Map.Types exposing (..)
import Objects.Manager exposing (..)
import Objects.Tiles.Background exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


map : Map.Types.Map msg -> List (GameObject msg)
map m =
    fill m.gameObjects.background (possibleTileCoords m)
        ++ m.gameObjects.roads
        ++ [ m.gameObjects.startLine, m.gameObjects.finishLine ]
        ++ m.gameObjects.checkPoints
        ++ m.gameObjects.decor


fill : GameObject msg -> List Position -> List (GameObject msg)
fill f l =
    case l of
        x :: xs ->
            { f | position = x } :: fill f xs

        [] ->
            []


possibleTileCoords : Map.Types.Map msg -> List Position
possibleTileCoords m =
    let
        createRows : Int -> Int -> List Position
        createRows yp xp =
            if xp < (m.dimension.width * m.dimension.tileSize) then
                Position { x = xp, y = yp } :: createRows yp (xp + m.dimension.tileSize)

            else if yp < (m.dimension.height * m.dimension.tileSize) then
                Position { x = 0, y = yp + m.dimension.tileSize } :: createRows (yp + m.dimension.tileSize) (0 + m.dimension.tileSize)

            else
                []
    in
    createRows 0 0
