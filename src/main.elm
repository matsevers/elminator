module Main exposing (Model, main)

import Browser
import Browser.Events exposing (..)
import Control.Global exposing (..)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Json.Decode exposing (..)
import Map.Generator exposing (..)
import Objects.Manager exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Tiles.Global exposing (..)


type alias Model =
    { map : List (Svg Msg)
    , objects : List (GameObject Msg)
    , player1 : GameObject Msg
    }


type Msg
    = KeyDown Action
    | None


initialModel : Model
initialModel =
    { map = Map.Generator.map
    , objects = []
    , player1 = Objects.Manager.ambulance
    }


view : Model -> Html Msg
view model =
    div
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex" "1"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "justify-content" "center"
        ]
        [ Svg.svg
            [ Svg.Attributes.width (String.fromInt (Tiles.Global.options.tileSize * Map.Generator.options.width))
            , Svg.Attributes.height (String.fromInt (Tiles.Global.options.tileSize * Map.Generator.options.height))
            , Svg.Attributes.viewBox
                ("0 0 "
                    ++ String.fromInt
                        (Tiles.Global.options.tileSize
                            * Map.Generator.options.width
                        )
                    ++ " "
                    ++ String.fromInt
                        (Tiles.Global.options.tileSize
                            * Map.Generator.options.height
                        )
                )
            ]
            (model.map ++ Objects.Manager.render [ model.player1 ])
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
                    ( { model
                        | player1 =
                            { player1
                                | position =
                                    { position
                                        | y = position.y - round (cos (degrees (toFloat player1.rotate)) * 20)
                                        , x = position.x + round (sin (degrees (toFloat player1.rotate)) * 20)
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
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
