module Objects.Manager exposing (ambulance, render)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Objects.Types exposing (GameObject)
import String exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)



-- --
-- type alias Collider msg =
--     Svg msg
-- type alias Sprite msg =
--     Svg msg
-- type Render msg
--     = Render (Sprite msg) (Collider msg)
-- --


ambulance : GameObject msg
ambulance =
    { identifier = "Player1"
    , position = Objects.Types.Position { x = 200, y = 200 }
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
            case x.position of
                Objects.Types.Position p ->
                    [ Svg.image
                        [ Svg.Attributes.xlinkHref x.sprite
                        , Svg.Attributes.width (String.fromInt x.size.width)
                        , Svg.Attributes.height (String.fromInt x.size.height)
                        , Svg.Attributes.x (String.fromInt p.x)
                        , Svg.Attributes.y (String.fromInt p.y)
                        , Svg.Attributes.transform
                            ("translate("
                                ++ String.fromInt x.size.width
                                ++ ","
                                ++ String.fromInt x.size.height
                                ++ ") rotate("
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
