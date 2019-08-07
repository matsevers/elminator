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
    case m.background of
        x :: xs ->
            fill x (possibleTileCoords m) ++ map { m | background = xs }

        [] ->
            []


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
            if xp < (m.width * 64) then
                { x = xp, y = yp } :: createRows yp (xp + 64)

            else if yp < (m.height * 64) then
                { x = 0, y = yp + 64 } :: createRows (yp + 64) (0 + 64)

            else
                []
    in
    createRows 0 0
