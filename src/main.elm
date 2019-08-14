module Main exposing (Model, main)

import Browser
import Browser.Events exposing (..)
import Control.Global exposing (..)
import Control.Player exposing (..)
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
import Ui.Speedometer exposing (..)


type State
    = Menu
    | Paused
    | Finished
    | Stopping
    | Starting
    | Running


type alias Model =
    { state : State
    , map : Map.Types.Map Msg -- Records of Map
    , myPlayer : Player Msg
    , onlinePlayers : List (Player Msg)
    , lab : Int
    }


type Msg
    = KeyDown Action
    | KeyUp Action
    | Interval
    | None


initialModel : Model
initialModel =
    { state = Running
    , map = Map.Variations.DustRace.model
    , myPlayer =
        { identifier = "blue"
        , assignedKeys =
            { forward = Control.Global.W
            , backward = Control.Global.S
            , left = Control.Global.A
            , right = Control.Global.D
            , action = Control.Global.Space
            }
        , storedKeys =
            { forward = Control.Global.Nothing
            , backward = Control.Global.Nothing
            , left = Control.Global.Nothing
            , right = Control.Global.Nothing
            }
        , controlledObject = Objects.Manager.ambulance
        }
    , onlinePlayers = []
    , lab = 0
    }


view : Model -> Html Msg
view model =
    div
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex" "1"
        , Html.Attributes.style "flex-direction" "row"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "justify-content" "center"
        ]
        [ div []
            []
        , div
            [ Html.Attributes.style "display" "flex"
            , Html.Attributes.style "flex-direction" "column"
            ]
            [ Svg.svg
                [ Svg.Attributes.width (String.fromInt (model.map.dimension.tileSize * model.map.dimension.width))
                , Svg.Attributes.height (String.fromInt (model.map.dimension.tileSize * model.map.dimension.height))
                , Svg.Attributes.viewBox
                    ("0 0 "
                        ++ String.fromInt
                            (model.map.dimension.tileSize
                                * model.map.dimension.width
                            )
                        ++ " "
                        ++ String.fromInt
                            (model.map.dimension.tileSize
                                * model.map.dimension.height
                            )
                    )
                ]
                (Objects.Manager.render (Map.Generator.map model.map ++ [ model.myPlayer.controlledObject ]))
            , div
                [ Html.Attributes.style "background-color" "rgb(32, 32, 32)"
                , Html.Attributes.style "display" "flex"
                , Html.Attributes.style "flex" "1"
                , Html.Attributes.style "flex-direction" "row"
                , Html.Attributes.style "align-items" "stretch"
                ]
                [ div
                    [ Html.Attributes.style "flex" "1" ]
                    [ Ui.Speedometer.element 100 0 100 ]
                , div
                    [ Html.Attributes.style "flex" "1" ]
                    [ Html.text "Test" ]
                , Svg.svg
                    [ Html.Attributes.style "flex" "1"
                    , Svg.Attributes.width
                        "100%"
                    , Svg.Attributes.height "100%"
                    , Svg.Attributes.viewBox
                        ("0 0 "
                            ++ String.fromInt
                                (model.map.dimension.tileSize
                                    * model.map.dimension.width
                                )
                            ++ " "
                            ++ String.fromInt
                                (model.map.dimension.tileSize
                                    * model.map.dimension.height
                                )
                        )
                    ]
                    (Objects.Manager.render (model.map.gameObjects.roads ++ [ model.myPlayer.controlledObject ]))
                ]
            ]
        , div
            []
            []
        ]


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

        listKeys =
            [ storedKeys.forward, storedKeys.backward, storedKeys.left, storedKeys.right ]
    in
    case msg of
        KeyDown action ->
            case action of
                Forward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | forward = Control.Global.Forward } } }, Cmd.none )

                Backward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | backward = Control.Global.Backward } } }, Cmd.none )

                Left ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | left = Control.Global.Left } } }, Cmd.none )

                Right ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | right = Control.Global.Right } } }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        KeyUp action ->
            case action of
                Forward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | forward = Control.Global.Nothing } } }, Cmd.none )

                Backward ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | backward = Control.Global.Nothing } } }, Cmd.none )

                Left ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | left = Control.Global.Nothing } } }, Cmd.none )

                Right ->
                    ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | right = Control.Global.Nothing } } }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        Interval ->
            let
                maxKraft : Int
                maxKraft =
                    10

                kraftVor : Int
                kraftVor =
                    4

                kraftRuck : Int
                kraftRuck =
                    -2

                winkel : Int
                winkel =
                    8

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
            in
            case controlledObject.position of
                Position p ->
                    ( { model
                        | myPlayer =
                            { myPlayer
                                | controlledObject =
                                    { controlledObject
                                        | rotate = modBy 360 (controlledObject.rotate + calcAngle listKeys)
                                        , position =
                                            Position
                                                { x = p.x + round (sin (degrees (toFloat controlledObject.rotate)) * toFloat (calcForce listKeys))
                                                , y = p.y - round (cos (degrees (toFloat controlledObject.rotate)) * toFloat (calcForce listKeys))
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
        [ onKeyDown (Json.Decode.map KeyDown keyDecoder)
        , onKeyUp (Json.Decode.map KeyUp keyDecoder)
        , Time.every 40 (\_ -> Interval)
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
