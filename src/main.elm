module Main exposing (main)

import Browser
import Browser.Events
import Cmd.Extra
import Control.Module
import Control.Player
import Html
import Html.Attributes
import InitialModel
import Json.Decode
import List
import Map.Track.Module
import Network.Module
import Objects.Physics
import Random
import Time
import Types
import UUID
import Ui.Scenes.FinishMenu.Module
import Ui.Scenes.MainMenu.Module
import Ui.Scenes.MainMenu.View
import Ui.Scenes.Module
import Ui.Scenes.Playground.Module


view : Types.Model -> Html.Html Types.Msg
view model =
    case model.state of
        Types.Running ->
            Ui.Scenes.Playground.Module.view model

        Types.PrepareRace ->
            Ui.Scenes.Playground.Module.view model

        Types.Menu ->
            Ui.Scenes.MainMenu.View.view model

        Types.Finished ->
            Ui.Scenes.FinishMenu.Module.view model


update : Types.Msg -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        Types.Tick ->
            if model.state == Types.Menu && model.network.multiplayer then
                model
                    |> Cmd.Extra.withCmd
                        (Network.Module.send
                            "lobby"
                            (Network.Module.encodeLobby model.ownLobby)
                        )

            else if model.state == Types.Running || model.state == Types.PrepareRace then
                (Objects.Physics.update <|
                    Control.Player.update <|
                        Network.Module.updateTtl <|
                            Map.Track.Module.update model
                )
                    |> Cmd.Extra.withCmd
                        (Network.Module.send
                            "player"
                            (Network.Module.encodePlayer model.myPlayer)
                        )

            else
                model |> Network.Module.updateTtl |> Cmd.Extra.withNoCmd

        Types.Control _ event action ->
            Control.Module.update event action model

        Types.Playground m ->
            Ui.Scenes.Playground.Module.update m model

        Types.MainMenu m ->
            Ui.Scenes.MainMenu.Module.update m model

        Types.FinishMenu m ->
            Ui.Scenes.FinishMenu.Module.update m model

        Types.SceneManager m ->
            Ui.Scenes.Module.update m model

        Types.Websocket m ->
            Network.Module.update m model

        Types.SetUUID t uuid ->
            let
                p =
                    model.myPlayer

                l =
                    model.ownLobby

                n =
                    model.network
            in
            case t of
                Types.PlayerUUID ->
                    { model | myPlayer = { p | identifier = UUID.toString uuid } } |> Cmd.Extra.withNoCmd

                Types.LobbyUUID ->
                    { model | ownLobby = { l | identifier = UUID.toString uuid }, network = { n | session = UUID.toString uuid } } |> Cmd.Extra.withNoCmd

        _ ->
            model |> Cmd.Extra.withNoCmd


subscriptions : Types.Model -> Sub Types.Msg
subscriptions model =
    Sub.batch
        [ Browser.Events.onKeyDown (Json.Decode.map (Types.Control model Types.Pressed) Control.Player.keyDecoder)
        , Browser.Events.onKeyUp (Json.Decode.map (Types.Control model Types.Released) Control.Player.keyDecoder)
        , Time.every model.frequence (\_ -> Types.Tick)
        , Network.Module.subPort (\v -> Types.Websocket (Types.Receive v))
        , Network.Module.parseReturn (\v -> Types.Websocket (Types.Process v))
        ]


main : Program () Types.Model Types.Msg
main =
    Browser.element
        { init =
            \_ ->
                ( InitialModel.initialModel
                , Cmd.batch
                    [ Network.Module.open
                    , Random.generate (Types.SetUUID Types.LobbyUUID) UUID.generator
                    , Random.generate (Types.SetUUID Types.PlayerUUID) UUID.generator
                    ]
                )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
