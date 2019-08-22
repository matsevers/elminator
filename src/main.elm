module Main exposing (main)

import Browser
import Browser.Events exposing (..)
import Control.Global exposing (..)
import Control.Player exposing (..)
import Control.Types exposing (..)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Json.Decode exposing (..)
import Map.Generator exposing (..)
import Map.Variations.DustRace exposing (..)
import Map.Variations.SummerBreeze exposing (..)
import Objects.Cars.Ambulance exposing (..)
import Objects.Cars.Police exposing (..)
import Objects.Cars.Taxi exposing (..)
import Objects.Manager exposing (..)
import Objects.Physics exposing (..)
import Objects.Types exposing (..)
import Time exposing (..)
import Types exposing (Model, Msg(..), State(..))
import Ui.Scenes.MainMenu.Actions exposing (..)
import Ui.Scenes.MainMenu.View exposing (..)
import Ui.Scenes.Manager exposing (..)
import Ui.Scenes.Playground.View exposing (..)


initialModel : Model
initialModel =
    { state = Menu
    , frequence = 40
    , availableCars = [ Objects.Cars.Taxi.model, Objects.Cars.Ambulance.model, Objects.Cars.Police.model ]
    , availableMaps = [ Map.Variations.DustRace.model, Map.Variations.SummerBreeze.model ]
    , map = Map.Variations.DustRace.model
    , myPlayer =
        { identifier = "blue"
        , name = "Player 1"
        , assignedKeys =
            { forward = Control.Types.W
            , backward = Control.Types.S
            , left = Control.Types.A
            , right = Control.Types.D
            , action = Control.Types.Space
            }
        , storedKeys =
            { forward = Control.Types.Nothing
            , backward = Control.Types.Nothing
            , left = Control.Types.Nothing
            , right = Control.Types.Nothing
            }
        , controlledObject = Objects.Cars.Taxi.model
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
        KeyEvent event action ->
            Control.Player.applyInput model event action

        Tick ->
            ( Objects.Physics.update <| Control.Player.update model, Cmd.none )

        ChangeScene s ->
            Ui.Scenes.Manager.changeTo s model

        ChangeMap m ->
            Ui.Scenes.MainMenu.Actions.changeMap model m

        ChangeCar c ->
            Ui.Scenes.MainMenu.Actions.changeCar model c

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ onKeyDown (Json.Decode.map (KeyEvent Pressed) keyDecoder)
        , onKeyUp (Json.Decode.map (KeyEvent Released) keyDecoder)
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
