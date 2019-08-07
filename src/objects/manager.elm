module Objects.Manager exposing (Collider, GameObject, Position, Render(..), Size, Sprite, ambulance, render)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import String exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


type alias Position =
    { x : Int
    , y : Int
    }


type alias Size =
    { height : Int
    , width : Int
    }


type alias Collider msg =
    Svg msg


type alias Sprite msg =
    Svg msg


type Render msg
    = Render (Sprite msg) (Collider msg)


type alias GameObject msg =
    { identifier : Int
    , size : Size
    , position : Position
    , sprite : String
    , collider : Svg msg
    , rotate : Int
    , speed : Int
    }


ambulance : GameObject msg
ambulance =
    { identifier = 1
    , position = { x = 200, y = 200 }
    , collider = Svg.rect [] []
    , sprite = "assets/carAmbulance.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , speed = 100
    }



-- move GameObject msg -> List (Svg msg)


render : List (GameObject msg) -> List (Svg msg)
render l =
    case l of
        [] ->
            []

        x :: xs ->
            [ Svg.image
                [ Svg.Attributes.xlinkHref x.sprite
                , Svg.Attributes.width (String.fromInt x.size.width)
                , Svg.Attributes.height (String.fromInt x.size.height)
                , Svg.Attributes.x (String.fromInt x.position.x)
                , Svg.Attributes.y (String.fromInt x.position.y)
                , Svg.Attributes.transform
                    ("translate(200, 200) rotate("
                        ++ String.fromInt x.rotate
                        ++ " "
                        ++ String.fromFloat (Basics.toFloat x.position.x + Basics.toFloat x.size.width / 2)
                        ++ " "
                        ++ String.fromFloat (Basics.toFloat x.position.y + Basics.toFloat x.size.height / 2)
                        ++ ")"
                    )
                ]
                []
            ]
                ++ render xs
