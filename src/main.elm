module Main exposing (main)

import Browser
import Browser.Events exposing (..)
import Cmd.Extra exposing (..)
import Control.Module exposing (..)
import Control.Player exposing (..)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import InitialModel exposing (..)
import Json.Decode exposing (..)
import Json.Encode exposing (Value)
import List exposing (..)
import Map.Generator exposing (..)
import Map.Track.Module exposing (..)
import Network.Module exposing (..)
import Objects.Physics exposing (..)
import Objects.Vehicle.Module
import Random
import Time exposing (..)
import Types exposing (..)
import UUID
import Ui.Scenes.FinishMenu.Module exposing (..)
import Ui.Scenes.FinishMenu.Update exposing (..)
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
            if model.state == Menu && model.network.multiplayer then
                model |> withCmd (Network.Module.send "lobby" (Network.Module.encodeLobby model.ownLobby))

            else if model.state == Running || model.state == PrepareRace then
                (Objects.Physics.update <|
                    Control.Player.update <|
                        Network.Module.updateTtl <|
                            Map.Track.Module.update model
                )
                    |> withCmd (Network.Module.send "player" (Network.Module.encodePlayer model.myPlayer))

            else if model.state == Types.Finished then
                let
                    lobbyControlMsg : LobbyControl
                    lobbyControlMsg =
                        { identifier = model.network.session
                        , playerId = model.myPlayer.identifier
                        , join = False
                        , start = False
                        , finish = True
                        }
                in
                model |> withCmd (Network.Module.send "lobbyControl" (Network.Module.encodeLobbyControl lobbyControlMsg))

            else
                model |> Network.Module.updateTtl |> withNoCmd

        Control _ event action ->
            Control.Module.update event action model

        Playground m ->
            Ui.Scenes.Playground.Module.update m model

        MainMenu m ->
            Ui.Scenes.MainMenu.Module.update m model

        SceneManager m ->
            Ui.Scenes.Module.update m model

        Websocket m ->
            Network.Module.update m model

        SetUUID t uuid ->
            let
                p =
                    model.myPlayer

                l =
                    model.ownLobby

                n =
                    model.network
            in
            case t of
                PlayerUUID ->
                    { model | myPlayer = { p | identifier = UUID.toString uuid } } |> withNoCmd

                LobbyUUID ->
                    { model | ownLobby = { l | identifier = UUID.toString uuid }, network = { n | session = UUID.toString uuid } } |> withNoCmd

        _ ->
            model |> withNoCmd


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ onKeyDown (Json.Decode.map (Control model Pressed) keyDecoder)
        , onKeyUp (Json.Decode.map (Control model Released) keyDecoder)
        , Time.every model.frequence (\_ -> Tick)
        , Network.Module.subPort (\v -> Websocket (Receive v))
        , Network.Module.parseReturn (\v -> Websocket (Process v))
        ]


main : Program () Model Msg
main =
    Browser.element
        { init =
            \_ ->
                ( InitialModel.initialModel
                , Cmd.batch
                    [ Network.Module.open
                    , Random.generate (SetUUID Types.LobbyUUID) UUID.generator
                    , Random.generate (SetUUID Types.PlayerUUID) UUID.generator
                    ]
                )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
