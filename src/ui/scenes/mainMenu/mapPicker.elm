module Ui.Scenes.MainMenu.MapPicker exposing (view)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Map.Types exposing (..)
import Types exposing (..)


view : Model -> List (Html Msg)
view model =
    renderMaps
        model.availableMaps
        model


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
                    (MainMenu
                        (ChangeMap
                            model
                            map
                        )
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
