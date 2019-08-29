module Ui.Scenes.Style exposing (button, globalContainer, menuContainer)

import Html
import Html.Attributes


globalContainer : List (Html.Attribute msg)
globalContainer =
    [ Html.Attributes.style "height" "100vh"
    , Html.Attributes.style "background-color" "#141617"
    , Html.Attributes.style "background-image" "url('assets/backgroundMenu.svg')"
    ]


menuContainer : List (Html.Attribute msg)
menuContainer =
    [ Html.Attributes.style "display" "flex"
    , Html.Attributes.style "justify-content" "flex-start"
    , Html.Attributes.style "align-items" "center"
    , Html.Attributes.style "flex-direction" "column"
    ]


button : List (Html.Attribute msg)
button =
    [ Html.Attributes.style "padding" "30px"
    , Html.Attributes.style "background-color" "#f21d9c"
    , Html.Attributes.style "color" "#ffffff"
    , Html.Attributes.style "border-width" "0px"
    , Html.Attributes.style "font-size" "20px"
    ]
