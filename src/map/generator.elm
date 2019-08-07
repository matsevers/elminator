module Map.Generator exposing (map, options, possibleTileCoords)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Tiles.Global exposing (..)
import Tiles.TileBackground exposing (..)
import Tiles.TileRoadLeftRight exposing (..)
import Tiles.TileRoadTopRight exposing (..)
import Tiles.TileRoadUpDown exposing (..)



-- Map Options


options =
    { width = 20 -- tiles
    , height = 10 -- tiles
    }


map : List  (Svg msg)
map =
 (fill Tiles.TileBackground.tile possibleTileCoords
            ++ fill Tiles.TileRoadUpDown.tile [ ( 64, 64 ), ( 64, 128 ), ( 64, 192 ) ]
            ++ fill Tiles.TileRoadTopRight.tile [ ( 64, 256 ) ]
            ++ fill Tiles.TileRoadLeftRight.tile [ ( 128, 256 ) ]
        )


fill : (( Int, Int ) -> Svg msg) -> List ( Int, Int ) -> List (Svg msg)
fill f l =
    case l of
        [] ->
            []

        x :: xs ->
            f x :: fill f xs


possibleTileCoords : List ( Int, Int )
possibleTileCoords =
    let
        createRows : Int -> Int -> List ( Int, Int )
        createRows yp xp =
            if xp < (options.width * Tiles.Global.options.tileSize) then
                ( xp, yp ) :: createRows yp (xp + Tiles.Global.options.tileSize)

            else if yp < (options.height * Tiles.Global.options.tileSize) then
                ( 0, yp + Tiles.Global.options.tileSize ) :: createRows (yp + Tiles.Global.options.tileSize) (0 + Tiles.Global.options.tileSize)

            else
                []
    in
    createRows 0 0
