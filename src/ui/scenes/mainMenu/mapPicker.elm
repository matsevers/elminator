module Ui.Scenes.MainMenu.MapPicker exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Map.Types exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    div
        [ style "display" "flex"
        , style "flex-direction" "row"
        , style "width" "100%"
        , style "justify-content" "center"
        ]
        [ div
            [ style "display" "flex"
            , style "flex-basis" "20%"
            , style "flex-grow" "0"
            , style "align-items" "center"
            , style "flex-direction" "column"
            , style "color" "#fff"
            , style "font-size" "25px"
            , style "font-family" "Arial"
            , style "padding" "20px"
            , style "background-color" "#763fdd"
            , style "margin" "20px"
            ]
            [ text "CHOOSE A RACE TRACK"
            , div [ style "margin-top" "20px" ]
                (renderMaps
                    model.availableMaps
                    model
                )
            ]
        , div
            [ style "flex-basis" "20%"
            , style "flex-grow" "0"
            , style "display" "flex"
            , style "align-items" "center"
            , style "flex-direction" "column"
            , style "color" "#fff"
            , style "font-size" "25px"
            , style "font-family" "Arial"
            , style "padding" "20px"
            , style "background-color" "#E664DD"
            , style "margin" "20px"
            ]
            [ text "CHOOSE A VEHICLE"
            ]
        ]


renderMaps : List Map.Types.Map -> Model -> List (Html Msg)
renderMaps l model =
    let
        renderMap : Map.Types.Map -> Html Msg
        renderMap map =
            let
                checkSelection : List (Html.Attribute msg)
                checkSelection =
                    if map.meta.name == model.map.meta.name then
                        [ style "background-color" "rgba(255,255,255, 0.4)" ]

                    else
                        []
            in
            div
                ([ style "display" "flex"
                 , style "align-self" "stretch"
                 , style "flex-direction" "column"
                 , style "align-items" "center"
                 , style "font-size" "14px"
                 , style "background-color" "rgba(255,255,255, 0.2)"
                 , style "padding" "10px"
                 , style "margin" "10px"
                 , style "cursor" "pointer"
                 , onClick
                    (ChangeMap
                        map
                    )
                 ]
                    ++ checkSelection
                )
                [ div [ style "font-size" "20px" ] [ text map.meta.name ]
                , div [] [ text map.meta.description ]
                ]
    in
    case l of
        [] ->
            []

        x :: xs ->
            renderMap x :: renderMaps xs model
