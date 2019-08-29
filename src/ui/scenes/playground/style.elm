module Ui.Scenes.Playground.Style exposing (cockpitContainer, flex1, infoRow, infoRowAntiSkewText, infoRowSkew)

import Html
import Html.Attributes


infoRow : List (Html.Attribute msg)
infoRow =
    [ Html.Attributes.style "color" "#fff"
    , Html.Attributes.style "font-family" "Arial"
    , Html.Attributes.style "display" "flex"
    , Html.Attributes.style "align-items" "stretch"
    , Html.Attributes.style "justify-content" "space-between"
    , Html.Attributes.style "background" "#28282b"
    , Html.Attributes.style "margin-top" "20px"
    , Html.Attributes.style "margin-left" "45px"
    , Html.Attributes.style "margin-right" "45px"
    , Html.Attributes.style "overflow" "hidden"
    ]


infoRowSkew : List (Html.Attribute msg)
infoRowSkew =
    [ Html.Attributes.style "background-color" "#530DD4"
    , Html.Attributes.style "transform" "skewX(30deg)"
    , Html.Attributes.style "margin-left" "-30px"
    , Html.Attributes.style "padding" "5px 20px 5px 50px"
    ]


infoRowAntiSkewText : List (Html.Attribute msg)
infoRowAntiSkewText =
    [ Html.Attributes.style "transform" "skewX(-30deg)" ]


cockpitContainer : List (Html.Attribute msg)
cockpitContainer =
    [ Html.Attributes.style "background-color" "#0b0c0c"
    , Html.Attributes.style "padding" "40px 0px 40px 0px"
    , Html.Attributes.style "display" "flex"
    , Html.Attributes.style "flex" "1"
    , Html.Attributes.style "flex-direction" "row"
    , Html.Attributes.style "align-items" "stretch"
    ]


flex1 : List (Html.Attribute msg)
flex1 =
    [ Html.Attributes.style "flex" "1", Html.Attributes.style "display" "flex" ]
