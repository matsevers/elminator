module Map.Generator exposing (fill, map, position, possibleTileCoords, rotate)

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
    case m.background of
        x :: xs ->
            fill x (possibleTileCoords m) ++ map { m | background = xs }

        [] ->
            [] ++ m.gameObjects


fill : GameObject msg -> List Position -> List (GameObject msg)
fill f l =
    case l of
        x :: xs ->
            { f | position = x } :: fill f xs

        [] ->
            []


rotate : GameObject msg -> Int -> GameObject msg
rotate gO r =
    { gO | rotate = r }


position : GameObject msg -> Position -> GameObject msg
position gO p =
    { gO | position = p }


possibleTileCoords : Map.Types.Map msg -> List Position
possibleTileCoords m =
    let
        createRows : Int -> Int -> List Position
        createRows yp xp =
            if xp < (m.width * m.tileSize) then
                Position { x = xp, y = yp } :: createRows yp (xp + m.tileSize)

            else if yp < (m.height * m.tileSize) then
                Position { x = 0, y = yp + m.tileSize } :: createRows (yp + m.tileSize) (0 + m.tileSize)

            else
                []
    in
    createRows 0 0
