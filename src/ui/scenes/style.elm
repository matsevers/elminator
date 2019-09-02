module Ui.Scenes.Style exposing
    ( button
    , centeredText
    , globalContainer
    , menuContainer
    , menuItem
    , menuItemLeft
    , menuItemRight
    , selectionContainer
    , spaceBottom
    , spaceTop
    )

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


menuItem : List (Html.Attribute msg)
menuItem =
    [ Html.Attributes.style "flex-basis" "20%"
    , Html.Attributes.style "flex-grow" "0"
    , Html.Attributes.style "display" "flex"
    , Html.Attributes.style "align-items" "stretch"
    , Html.Attributes.style "flex-direction" "column"
    , Html.Attributes.style "color" "#fff"
    , Html.Attributes.style "font-size" "25px"
    , Html.Attributes.style "font-family" "Arial"
    , Html.Attributes.style "padding" "20px"
    , Html.Attributes.style "margin" "20px"
    ]


menuItemLeft : List (Html.Attribute msg)
menuItemLeft =
    [ Html.Attributes.style "background-color"
        "#763fdd"
    , Html.Attributes.style "transform"
        "perspective(400px) rotateY(15deg) rotateX(5deg)"
    ]


menuItemRight : List (Html.Attribute msg)
menuItemRight =
    [ Html.Attributes.style
        "background-color"
        "#E664DD"
    , Html.Attributes.style
        "transform"
        "perspective(400px) rotateY(-15deg) rotateX(5deg)"
    ]


centeredText : List (Html.Attribute msg)
centeredText =
    [ Html.Attributes.style "text-align" "center" ]


spaceTop : List (Html.Attribute msg)
spaceTop =
    [ Html.Attributes.style "margin-top" "20px" ]


spaceBottom : List (Html.Attribute msg)
spaceBottom =
    [ Html.Attributes.style "margin-bottom" "20px" ]


selectionContainer : List (Html.Attribute msg)
selectionContainer =
    [ Html.Attributes.style "display" "flex"
    , Html.Attributes.style "align-self" "stretch"
    , Html.Attributes.style "flex-direction" "column"
    , Html.Attributes.style "align-items" "center"
    , Html.Attributes.style "font-size" "14px"
    , Html.Attributes.style "background-color" "rgba(255,255,255, 0.2)"
    , Html.Attributes.style "padding" "10px"
    , Html.Attributes.style "margin" "10px"
    , Html.Attributes.style "cursor" "pointer"
    ]
