module Ui.Scenes.MainMenu.Style exposing
    ( carSelectionInnerContainer
    , centeredText
    , input
    , logo
    , menuItem
    , menuItemContainer
    , selectionContainer
    , spaceBottom
    , spaceTop
    )

import Html
import Html.Attributes


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


centeredText : List (Html.Attribute msg)
centeredText =
    [ Html.Attributes.style "text-align" "center" ]


spaceTop : List (Html.Attribute msg)
spaceTop =
    [ Html.Attributes.style "margin-top" "20px" ]


spaceBottom : List (Html.Attribute msg)
spaceBottom =
    [ Html.Attributes.style "margin-bottom" "20px" ]


input : List (Html.Attribute msg)
input =
    [ Html.Attributes.style "flex" "1"
    , Html.Attributes.style "font-size" "22px"
    , Html.Attributes.style "color" "#fff"
    , Html.Attributes.style "background-color" "transparent"
    , Html.Attributes.style "border" "0px solid #fff"
    , Html.Attributes.style "border-bottom" "1px solid rgba(255,255,255,0.5)"
    ]
