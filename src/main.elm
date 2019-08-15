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
import Map.Types exposing (..)
import Map.Variations.DustRace exposing (..)
import Objects.Manager exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (..)
import Types exposing (Model, Msg(..), State(..))
import Ui.Cockpit exposing (..)
import Ui.Playground exposing (..)
import Ui.Speedometer exposing (..)



-- Intervall in miliseconds


frequence : Float
frequence =
    40


initialModel : Model
initialModel =
    { state = Running
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
        , controlledObject = Objects.Manager.ambulance
        }
    , onlinePlayers = []
    , lab = 0
    }


view : Model -> Html Msg
view =
    Ui.Playground.element


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        myPlayer =
            model.myPlayer

        storedKeys =
            myPlayer.storedKeys

        controlledObject =
            myPlayer.controlledObject

        position =
            controlledObject.position

        motion =
            controlledObject.motion

        listKeys =
            [ storedKeys.forward, storedKeys.backward, storedKeys.left, storedKeys.right ]
    in
    case msg of
        KeyEvent event action ->
            Control.Player.applyInput model event action

        Interval ->
            let
                kraftVor : Int
                kraftVor =
                    2

                kraftRuck : Int
                kraftRuck =
                    -1

                winkel : Int
                winkel =
                    6

                calcAngle : List Action -> Int
                calcAngle l =
                    case l of
                        x :: xs ->
                            case x of
                                Left ->
                                    -winkel + calcAngle xs

                                Right ->
                                    winkel + calcAngle xs

                                _ ->
                                    0 + calcAngle xs

                        [] ->
                            0

                calcForce : List Action -> Int
                calcForce l =
                    case l of
                        [] ->
                            0

                        x :: xs ->
                            case x of
                                Forward ->
                                    kraftVor + calcForce xs

                                Backward ->
                                    kraftRuck + calcForce xs

                                _ ->
                                    0 + calcForce xs

                updateMotion : Objects.Types.Motion -> Int -> Objects.Types.Motion
                updateMotion m cSpeed =
                    if cSpeed == 0 then
                        -- Abbremsen
                        if m.speed > 0 then
                            { m | speed = m.speed + kraftRuck }

                        else if m.speed < 0 then
                            { m | speed = m.speed - kraftRuck }

                        else
                            m

                    else if cSpeed > 0 then
                        -- Beschleunigen
                        if (m.speed + cSpeed) <= m.maxForwardSpeed then
                            { m | speed = m.speed + cSpeed }

                        else
                            { m | speed = m.maxForwardSpeed }

                    else if cSpeed < 0 then
                        -- Rückwarts / Bremsen
                        if (m.speed + cSpeed) >= -m.maxBackwardSpeed then
                            { m | speed = m.speed + cSpeed }

                        else
                            { m | speed = -m.maxBackwardSpeed }

                    else
                        m
            in
            case controlledObject.position of
                Position p ->
                    ( { model
                        | myPlayer =
                            { myPlayer
                                | controlledObject =
                                    { controlledObject
                                        | rotate = modBy 360 (controlledObject.rotate + calcAngle listKeys)
                                        , motion = updateMotion motion (calcForce listKeys)
                                        , position =
                                            Position
                                                { x = p.x + round (sin (degrees (toFloat controlledObject.rotate)) * toFloat motion.speed / frequence * 4)
                                                , y = p.y - round (cos (degrees (toFloat controlledObject.rotate)) * toFloat motion.speed / frequence * 4)
                                                }
                                    }
                            }
                      }
                    , Cmd.none
                    )

                _ ->
                    ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ onKeyDown (Json.Decode.map (KeyEvent Pressed) keyDecoder)
        , onKeyUp (Json.Decode.map (KeyEvent Released) keyDecoder)
        , Time.every frequence (\_ -> Interval)
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
