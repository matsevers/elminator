module Objects.Manager exposing (ambulance, applyMotionFunction, motion, position, render, rotate)

import Control.Types exposing (..)
import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Objects.Physics exposing (..)
import Objects.Types exposing (..)
import String exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


ambulance : GameObject
ambulance =
    { identifier = "ambulance"
    , size = { height = 32, width = 32 }
    , position = Just { x = 450, y = 100 }
    , sprite = "assets/carAmbulance.png"
    , collider =
        Just
            (Rect
                { width = 8
                , height = 8
                , position = { x = 12, y = 12 }
                , impactFunction = Maybe.Nothing
                }
            )
    , rotate = 90
    , motion =
        Just
            { speed = 0
            , maxForwardSpeed = 80
            , maxBackwardSpeed = 20
            }
    , physics =
        Just
            { forceForward = 2
            , forceBackward = -1
            , impacts = []
            }
    }


applyMotionFunction : (Objects.Types.GameObject -> Float -> Float) -> Objects.Types.GameObject -> Float -> Objects.Types.Motion
applyMotionFunction f gO forceInput =
    let
        m =
            Maybe.withDefault { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 } gO.motion
    in
    { m | speed = f gO forceInput }


rotate : Int -> GameObject -> GameObject
rotate r gO =
    { gO | rotate = r }


position : Maybe Position -> GameObject -> GameObject
position p gO =
    { gO | position = p }


motion : Maybe Motion -> GameObject -> GameObject
motion m gO =
    { gO | motion = m }


collisionDetected : GameObject -> GameObject -> String
collisionDetected gO1 gO2 =
    if not (checkCollision gO1 gO2 == Maybe.Nothing) then
        "green"

    else
        "red"


render : List GameObject -> Player -> List (Svg msg)
render l player =
    case l of
        [] ->
            []

        x :: xs ->
            case x.position of
                Maybe.Nothing ->
                    render xs player

                Just posX ->
                    [ Svg.image
                        [ Svg.Attributes.xlinkHref x.sprite
                        , Svg.Attributes.width (String.fromInt x.size.width)
                        , Svg.Attributes.height (String.fromInt x.size.height)
                        , Svg.Attributes.x (String.fromInt posX.x)
                        , Svg.Attributes.y (String.fromInt posX.y)
                        , Svg.Attributes.transform
                            (" rotate("
                                ++ String.fromInt x.rotate
                                ++ " "
                                ++ String.fromFloat (Basics.toFloat posX.x + Basics.toFloat x.size.width / 2)
                                ++ " "
                                ++ String.fromFloat (Basics.toFloat posX.y + Basics.toFloat x.size.height / 2)
                                ++ ")"
                            )
                        ]
                        []
                    ]
                        ++ renderCollider x player.controlledObject
                        ++ render xs player


renderCollider : GameObject -> GameObject -> List (Svg msg)
renderCollider gO player =
    case gO.position of
        Just p ->
            case gO.collider of
                Just c ->
                    case c of
                        Rect r ->
                            [ Svg.rect
                                [ Svg.Attributes.width (String.fromInt r.width)
                                , Svg.Attributes.height (String.fromInt r.height)
                                , Svg.Attributes.x (String.fromInt (p.x + r.position.x))
                                , Svg.Attributes.y (String.fromInt (p.y + r.position.y))
                                , Svg.Attributes.stroke (collisionDetected player gO)
                                , Svg.Attributes.fillOpacity "0"
                                ]
                                []
                            ]

                        _ ->
                            []

                Maybe.Nothing ->
                    []

        Maybe.Nothing ->
            []
