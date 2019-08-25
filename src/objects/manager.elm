module Objects.Manager exposing (motion, position, render, rotate)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Objects.Physics exposing (..)
import String exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)


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


render : List GameObject -> Player -> Bool -> Bool -> Bool -> List (Svg msg)
render l player minimapMode debug labelsEnabled =
    let
        getSprite : GameObject -> String
        getSprite gO =
            if minimapMode then
                case gO.spriteMinimap of
                    Just a ->
                        a

                    _ ->
                        ""

            else
                gO.sprite

        getCollider : GameObject -> Maybe GameObject
        getCollider gO =
            if debug then
                Just gO

            else
                Maybe.Nothing
    in
    case l of
        [] ->
            []

        x :: xs ->
            case x.position of
                Maybe.Nothing ->
                    render xs player minimapMode debug labelsEnabled

                Just posX ->
                    [ Svg.image
                        [ Svg.Attributes.xlinkHref (getSprite x)
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
                        ++ renderCollider (getCollider x) player.controlledObject
                        ++ render xs player minimapMode debug labelsEnabled
                        ++ renderPlayer player labelsEnabled


renderCollider : Maybe GameObject -> GameObject -> List (Svg msg)
renderCollider g player =
    case g of
        Just gO ->
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

        Maybe.Nothing ->
            []



-- TODO: Move this function to control/player.elm


renderPlayer : Player -> Bool -> List (Svg msg)
renderPlayer player labelsEnabled =
    let
        renderLabel : List (Svg msg)
        renderLabel =
            if not labelsEnabled then
                []

            else
                case player.label of
                    Just l ->
                        if l.visible then
                            case player.controlledObject.position of
                                Just pos ->
                                    [ Svg.text_
                                        [ x (String.fromInt (pos.x + player.controlledObject.size.width // 2))
                                        , y (String.fromInt (pos.y - 10))
                                        , fontFamily "Arial"
                                        , fill l.color
                                        , stroke "#000"
                                        , fontSize (String.fromInt l.size)
                                        , textAnchor "middle"
                                        ]
                                        [ text l.text ]
                                    ]

                                Maybe.Nothing ->
                                    []

                        else
                            []

                    Maybe.Nothing ->
                        []
    in
    renderLabel
