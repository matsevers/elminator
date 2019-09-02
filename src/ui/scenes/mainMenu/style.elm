module Ui.Scenes.MainMenu.Style exposing
    ( carSelectionInnerContainer
    , input
    , logo
    , menuItemContainer
    )

import Html
import Html.Attributes


carSelectionInnerContainer : List (Html.Attribute msg)
carSelectionInnerContainer =
    [ Html.Attributes.style "font-size" "20px"
    , Html.Attributes.style "display" "flex"
    , Html.Attributes.style "justify-content" "space-between"
    , Html.Attributes.style "width" "100%"
    ]


logo : List (Html.Attribute msg)
logo =
    [ Html.Attributes.src "assets/logo.png"
    , Html.Attributes.style "width" "70vh"
    , Html.Attributes.style "height" "auto"
    ]


menuItemContainer : List (Html.Attribute msg)
menuItemContainer =
    [ Html.Attributes.style "display" "flex"
    , Html.Attributes.style "flex-direction" "row"
    , Html.Attributes.style "width" "100%"
    , Html.Attributes.style "justify-content" "center"
    ]


input : List (Html.Attribute msg)
input =
    [ Html.Attributes.style "flex" "1"
    , Html.Attributes.style "font-size" "18px"
    , Html.Attributes.style "color" "#fff"
    , Html.Attributes.style "background-color" "transparent"
    , Html.Attributes.style "border" "0px solid #fff"
    , Html.Attributes.style "border-bottom" "1px solid rgba(255,255,255,0.5)"
    ]
