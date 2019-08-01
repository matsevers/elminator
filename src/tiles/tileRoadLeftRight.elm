module Tiles.TileRoadLeftRight exposing (tile)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Tiles.Global exposing (..)
import Tuple exposing (..)


tile : ( Int, Int ) -> Svg msg
tile t =
    Svg.image
        [ Svg.Attributes.x (String.fromInt (Tuple.first t))
        , Svg.Attributes.y (String.fromInt (Tuple.second t))
        , Svg.Attributes.width (String.fromInt Tiles.Global.options.tileSize)
        , Svg.Attributes.height (String.fromInt Tiles.Global.options.tileSize)
        , Svg.Attributes.xlinkHref "assets/roadLeftRight.png"
        ]
        []
