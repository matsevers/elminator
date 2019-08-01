module Main exposing (Model, main)

import Browser
import Browser.Events exposing (..)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Map.Generator exposing (..)
import Tiles.Global exposing (..)


type alias Model =
    { value : Int }


type Msg
    = None


initialModel : Model
initialModel =
    { value = 0 }


view : Model -> Html Msg
view model =
    div
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex" "1"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "justify-content" "center"
        ]
        [ Map.Generator.map ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , view = view
        , update = update
        }
