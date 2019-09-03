module Ui.Scenes.MainMenu.Update exposing (changeCar, changeMap, update)

import InitialModel
import Network.Module
import Random
import String
import Types
import UUID


update : Types.MainMenuMessage -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        Types.ChangeCar _ gO ->
            changeCar model gO

        Types.ChangeMap _ m ->
            changeMap model m

        Types.ChangeName _ name ->
            changeName model name

        Types.ChangePlayerCount _ c ->
            changePlayerCount model c

        Types.ChangeGameType _ ->
            changeGameType model

        Types.JoinLobby _ lobby ->
            joinLobby model lobby

        Types.LeaveLobby _ lobby ->
            leaveLobby model lobby


joinLobby : Types.Model -> Types.Lobby -> ( Types.Model, Cmd Types.Msg )
joinLobby model lobby =
    let
        n =
            model.network

        lobbyControl =
            { identifier = lobby.identifier
            , playerId = model.myPlayer.identifier
            , join = True
            , start = False
            , finish = False
            , leave = False
            }
    in
    ( { model
        | network = { n | session = lobby.identifier }
      }
    , Network.Module.send
        "lobbyControl"
        (Network.Module.encodeLobbyControl lobbyControl)
    )


leaveLobby : Types.Model -> Types.Lobby -> ( Types.Model, Cmd Types.Msg )
leaveLobby model lobby =
    let
        n =
            model.network

        lobbyControl =
            { identifier = lobby.identifier
            , playerId = model.myPlayer.identifier
            , join = False
            , start = False
            , finish = False
            , leave = True
            }
    in
    ( { model
        | network = { n | session = "" }
      }
    , Network.Module.send
        "lobbyControl"
        (Network.Module.encodeLobbyControl lobbyControl)
    )


changeCar : Types.Model -> Types.GameObject -> ( Types.Model, Cmd Types.Msg )
changeCar model gO =
    let
        myPlayer =
            model.myPlayer
    in
    ( { model | myPlayer = { myPlayer | controlledObject = gO } }, Cmd.none )


changeMap : Types.Model -> Types.Map -> ( Types.Model, Cmd Types.Msg )
changeMap model m =
    let
        l =
            model.ownLobby
    in
    ( { model | map = m, ownLobby = { l | map = m.meta.name } }, Cmd.none )


changePlayerCount : Types.Model -> String -> ( Types.Model, Cmd Types.Msg )
changePlayerCount model c =
    let
        l =
            model.ownLobby
    in
    case String.toInt c of
        Just count ->
            ( { model | ownLobby = { l | maxPlayer = count } }, Cmd.none )

        Maybe.Nothing ->
            ( { model | ownLobby = { l | maxPlayer = 1 } }, Cmd.none )


changeName : Types.Model -> String -> ( Types.Model, Cmd Types.Msg )
changeName model name =
    let
        myPlayer =
            model.myPlayer

        label =
            model.myPlayer.label
    in
    ( { model
        | myPlayer =
            { myPlayer
                | label = { label | text = name }
            }
      }
    , Cmd.none
    )


changeGameType : Types.Model -> ( Types.Model, Cmd Types.Msg )
changeGameType model =
    let
        n =
            model.network

        l =
            model.ownLobby
    in
    if n.multiplayer then
        ( { model
            | network = InitialModel.initialModel.network
            , ownLobby = InitialModel.initialModel.ownLobby
          }
        , Random.generate (Types.SetUUID Types.LobbyUUID) UUID.generator
        )

    else
        ( { model
            | network =
                { n
                    | multiplayer = True
                    , session = model.ownLobby.identifier
                }
            , ownLobby =
                { l
                    | onlinePlayers =
                        model.myPlayer.identifier
                            :: l.onlinePlayers
                    , running = False
                }
          }
        , Cmd.none
        )
