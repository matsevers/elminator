module Objects.Manager exposing (ambulance, render)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Objects.Types exposing (GameObject)
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
        , maxForwardSpeed = 100
        , maxBackwardSpeed = 20
        }
    }


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
