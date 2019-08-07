module Tiles.Global exposing (options)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


options =
    { tileSize = 64
    }


tile : ( Int, Int ) -> Svg msg
tile t =
    Svg.image
        [ Svg.Attributes.x (String.fromInt (Tuple.first t))
        , Svg.Attributes.y (String.fromInt (Tuple.second t))
        , Svg.Attributes.width (String.fromInt options.tileSize)
        , Svg.Attributes.height (String.fromInt options.tileSize)
        , Svg.Attributes.xlinkHref "assets/background.png"
        ]
        []
