module Main exposing (main)

import Browser
import Browser.Events exposing (..)
import Control.Global exposing (..)
import Control.Module exposing (..)
import Control.Player exposing (..)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import InitialModel exposing (..)
import Json.Decode exposing (..)
import List exposing (..)
import Map.Generator exposing (..)
import Map.Track.Module exposing (..)
import Objects.Manager exposing (..)
import Objects.Physics exposing (..)
import Objects.Vehicle.Module
import Time exposing (..)
import Types exposing (..)
import Ui.Scenes.FinishMenu.Module exposing (..)
import Ui.Scenes.MainMenu.Module exposing (..)
import Ui.Scenes.MainMenu.View exposing (..)
import Ui.Scenes.Module exposing (..)
import Ui.Scenes.Playground.Module exposing (..)


view : Model -> Html Msg
view model =
    case model.state of
        Running ->
            Ui.Scenes.Playground.Module.view model

        PrepareRace ->
            Ui.Scenes.Playground.Module.view model

        Menu ->
            Ui.Scenes.MainMenu.View.view model

        Finished ->
            Ui.Scenes.FinishMenu.Module.view model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick ->
            if model.state == Running || model.state == PrepareRace then
                ( Objects.Physics.update <| Control.Player.update <| Map.Track.Module.update model, Cmd.none )

            else
                ( model, Cmd.none )

        Control _ event action ->
            Control.Module.update event action model

        Playground m ->
            Ui.Scenes.Playground.Module.update m model

        MainMenu m ->
            Ui.Scenes.MainMenu.Module.update m model

        SceneManager m ->
            Ui.Scenes.Module.update m model

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ onKeyDown (Json.Decode.map (Control model Pressed) keyDecoder)
        , onKeyUp (Json.Decode.map (Control model Released) keyDecoder)
        , Time.every model.frequence (\_ -> Tick)
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( InitialModel.initialModel, Cmd.none )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
