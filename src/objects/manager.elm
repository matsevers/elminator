module Objects.Manager exposing (ambulance, applyMotionFunction, motion, position, render, rotate)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Objects.Types exposing (..)
import String exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


ambulance : GameObject msg
ambulance =
    { identifier = "ambulance"
    , position = Objects.Types.Position { x = 450, y = 100 }
    , collider = Svg.rect [] []
    , sprite = "assets/carAmbulance.png"
    , size = { height = 32, width = 32 }
    , rotate = 90
    , motion =
        { speed = 0
        , maxForwardSpeed = 80
        , maxBackwardSpeed = 20
        }
    , physics =
        { forceForward = 2
        , forceBackward = -1
        }
    }


applyMotionFunction : (Objects.Types.GameObject msg -> Float -> Float) -> Objects.Types.GameObject msg -> Float -> Objects.Types.Motion
applyMotionFunction f gO forceInput =
    let
        m =
            gO.motion
    in
    { m | speed = f gO forceInput }


rotate : Int -> GameObject msg -> GameObject msg
rotate r gO =
    { gO | rotate = r }


position : Position -> GameObject msg -> GameObject msg
position p gO =
    { gO | position = p }


motion : Motion -> GameObject msg -> GameObject msg
motion m gO =
    { gO | motion = m }


render : List (GameObject msg) -> List (Svg msg)
render l =
    case l of
        [] ->
            []

        x :: xs ->
            case x.position of
                Objects.Types.Position p ->
                    [ Svg.image
                        [ Svg.Attributes.xlinkHref x.sprite
                        , Svg.Attributes.width (String.fromInt x.size.width)
                        , Svg.Attributes.height (String.fromInt x.size.height)
                        , Svg.Attributes.x (String.fromInt p.x)
                        , Svg.Attributes.y (String.fromInt p.y)
                        , Svg.Attributes.transform
                            (" rotate("
                                ++ String.fromInt x.rotate
                                ++ " "
                                ++ String.fromFloat (Basics.toFloat p.x + Basics.toFloat x.size.width / 2)
                                ++ " "
                                ++ String.fromFloat (Basics.toFloat p.y + Basics.toFloat x.size.height / 2)
                                ++ ")"
                            )
                        ]
                        []
                    ]
                        ++ render xs

                Objects.Types.None ->
                    render xs
