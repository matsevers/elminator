module Ui.Scenes.MainMenu.MapPicker exposing (view)

import Html
import Html.Attributes
import Html.Events
import Types


view : Types.Model -> List (Html.Html Types.Msg)
view model =
    renderMaps
        model.availableMaps
        model


renderMaps : List Types.Map -> Types.Model -> List (Html.Html Types.Msg)
renderMaps l model =
    let
        renderMap : Types.Map -> Html.Html Types.Msg
        renderMap map =
            let
                checkSelection : List (Html.Attribute msg)
                checkSelection =
                    if map.meta.name == model.map.meta.name then
                        [ Html.Attributes.style "background-color" "rgba(255,255,255, 0.4)" ]

                    else
                        []
            in
            Html.div
                ([ Html.Attributes.style "display" "flex"
                 , Html.Attributes.style "align-self" "stretch"
                 , Html.Attributes.style "flex-direction" "column"
                 , Html.Attributes.style "align-items" "center"
                 , Html.Attributes.style "font-size" "14px"
                 , Html.Attributes.style "background-color" "rgba(255,255,255, 0.2)"
                 , Html.Attributes.style "padding" "10px"
                 , Html.Attributes.style "margin" "10px"
                 , Html.Attributes.style "cursor" "pointer"
                 , Html.Events.onClick
                    (Types.MainMenu
                        (Types.ChangeMap
                            model
                            map
                        )
                    )
                 ]
                    ++ checkSelection
                )
                [ Html.div
                    [ Html.Attributes.style "font-size" "20px" ]
                    [ Html.text map.meta.name ]
                , Html.div
                    []
                    [ Html.text map.meta.description ]
                ]
    in
    case l of
        [] ->
            []

        x :: xs ->
            renderMap x :: renderMaps xs model
