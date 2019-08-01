module Tiles.Global exposing (options, style)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)


options =
    { tileSize = 64
    }


style : List (Html.Attribute msg)
style =
    [ Html.Attributes.style "display" "flex"
    , Html.Attributes.style "width" (String.fromInt options.tileSize ++ "px")
    , Html.Attributes.style "height" (String.fromInt options.tileSize ++ "px")
    , Html.Attributes.style "margin" "0px"
    , Html.Attributes.style "padding" "0px"
    , Html.Attributes.style "border" "1px solid lightgray"
    ]
