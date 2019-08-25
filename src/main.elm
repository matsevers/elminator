module Main exposing (main)

import Browser
import Browser.Events exposing (..)
import Control.Global exposing (..)
import Control.Module exposing (..)
import Control.Player exposing (..)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Json.Decode exposing (..)
import List exposing (..)
import Map.Generator exposing (..)
import Map.Track.Module exposing (..)
import Objects.Manager exposing (..)
import Objects.Physics exposing (..)
import Objects.Vehicle.Module
import Time exposing (..)
import Types exposing (..)
import Ui.Scenes.MainMenu.Module exposing (..)
import Ui.Scenes.MainMenu.View exposing (..)
import Ui.Scenes.Module exposing (..)
import Ui.Scenes.Playground.View exposing (..)


initialModel : Model
initialModel =
    { state = Menu
    , frequence = 40
    , availableCars = Objects.Vehicle.Module.vehicles
    , availableMaps = Map.Track.Module.tracks
    , map = Map.Track.Module.defaultTrack
    , myPlayer =
        { identifier = "blue"
        , name = "Player 1"
        , assignedKeys =
            { forward = Types.W
            , backward = Types.S
            , left = Types.A
            , right = Types.D
            , action = Types.Space
            }
        , storedKeys =
            { forward = Types.Nothing
            , backward = Types.Nothing
            , left = Types.Nothing
            , right = Types.Nothing
            }
        , controlledObject = Objects.Vehicle.Module.defaultVehicle
        , catchedCheckPoints = []
        }
    , onlinePlayers = []
    , lab = 0
    }


view : Model -> Html Msg
view model =
    case model.state of
        Running ->
            Ui.Scenes.Playground.View.view model

        Menu ->
            Ui.Scenes.MainMenu.View.view model

        _ ->
            Ui.Scenes.MainMenu.View.view model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick ->
            ( Objects.Physics.update <| Control.Player.update model, Cmd.none )

        Control _ event action ->
            Control.Module.update event action model

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
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
