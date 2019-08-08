module Main exposing (Model, main)

import Browser
import Browser.Events exposing (..)
import Control.Global exposing (..)
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
    , player1 : GameObject Msg
    , lab : Int
    }


type Msg
    = KeyDown Action
    | Move
    | None


initialModel : Model
initialModel =
    { state = Running
    , map = Map.Variations.DustRace.model
    , player1 = Objects.Manager.ambulance
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
                (Objects.Manager.render (Map.Generator.map model.map ++ [ model.player1 ]))
            , div
                [ Html.Attributes.style "background-color" "rgb(32, 32, 32)"
                , Html.Attributes.style "display" "flex"
                , Html.Attributes.style "flex" "1"
                , Html.Attributes.style "flex-direction" "row"
                , Html.Attributes.style "align-items" "stretch"
                ]
                [ div
                    [ Html.Attributes.style "flex" "1" ]
                    [ Ui.Speedometer.element 0 0 0 ]
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
                    (Objects.Manager.render (model.map.gameObjects.roads ++ [ model.player1 ]))
                ]
            ]
        , div
            []
            []
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyDown action ->
            case action of
                Right ->
                    let
                        player1 =
                            model.player1
                    in
                    ( { model | player1 = { player1 | rotate = modBy 360 (player1.rotate + 5) } }, Cmd.none )

                Left ->
                    let
                        player1 =
                            model.player1
                    in
                    ( { model | player1 = { player1 | rotate = modBy 360 (player1.rotate - 5) } }, Cmd.none )

                Forward ->
                    let
                        player1 =
                            model.player1

                        position =
                            model.player1.position
                    in
                    case player1.position of
                        Position p ->
                            ( { model
                                | player1 =
                                    { player1
                                        | position =
                                            Position
                                                { x = p.x + round (sin (degrees (toFloat player1.rotate)) * 20)
                                                , y = p.y - round (cos (degrees (toFloat player1.rotate)) * 20)
                                                }
                                    }
                              }
                            , Cmd.none
                            )

                        _ ->
                            ( model, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ onKeyDown (Json.Decode.map KeyDown keyDecoder)
        , Time.every 200 (\_ -> Move)
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
