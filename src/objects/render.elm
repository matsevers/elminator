module Objects.Render exposing
    ( collider
    , player
    , playground
    )

import Objects.Physics
import String
import Svg
import Svg.Attributes exposing (..)
import Types exposing (..)


playground : List GameObject -> Player -> Bool -> Bool -> Bool -> List (Svg.Svg msg)
playground l p minimapMode debug labelsEnabled =
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
                    playground xs p minimapMode debug labelsEnabled

                Just posX ->
                    [ Svg.image
                        [ Svg.Attributes.xlinkHref (getSprite x)
                        , Svg.Attributes.width (String.fromInt x.size.width)
                        , Svg.Attributes.height (String.fromInt x.size.height)
                        , Svg.Attributes.x (String.fromInt posX.x)
                        , Svg.Attributes.y (String.fromInt posX.y)
                        , Svg.Attributes.transform
                            (" rotate("
                                ++ String.fromFloat x.rotate
                                ++ " "
                                ++ String.fromFloat (Basics.toFloat posX.x + Basics.toFloat x.size.width / 2)
                                ++ " "
                                ++ String.fromFloat (Basics.toFloat posX.y + Basics.toFloat x.size.height / 2)
                                ++ ")"
                            )
                        ]
                        []
                    ]
                        ++ collider (getCollider x) p.controlledObject
                        ++ playground xs p minimapMode debug labelsEnabled
                        ++ player p labelsEnabled


collider : Maybe GameObject -> GameObject -> List (Svg.Svg msg)
collider g p =
    let
        collisionDetected : Types.GameObject -> Types.GameObject -> String
        collisionDetected gO1 gO2 =
            if not (Objects.Physics.checkCollision gO1 [ gO2 ] == [ gO2 ]) then
                "green"

            else
                "red"
    in
    case g of
        Just gO ->
            case gO.position of
                Just pos ->
                    case gO.collider of
                        Just c ->
                            case c of
                                Rect r ->
                                    [ Svg.rect
                                        [ Svg.Attributes.width (String.fromInt r.width)
                                        , Svg.Attributes.height (String.fromInt r.height)
                                        , Svg.Attributes.x (String.fromInt (pos.x + r.position.x))
                                        , Svg.Attributes.y (String.fromInt (pos.y + r.position.y))
                                        , Svg.Attributes.stroke (collisionDetected p gO)
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


player : Player -> Bool -> List (Svg.Svg msg)
player p labelsEnabled =
    let
        renderLabel : List (Svg.Svg msg)
        renderLabel =
            if not labelsEnabled then
                []

            else if p.label.visible then
                case p.controlledObject.position of
                    Just pos ->
                        [ Svg.text_
                            [ x
                                (String.fromInt
                                    (pos.x
                                        + p.controlledObject.size.width
                                        // 2
                                    )
                                )
                            , y (String.fromInt (pos.y - 10))
                            , fontFamily "Arial"
                            , fill p.label.color
                            , stroke "#000"
                            , fontSize (String.fromInt p.label.size)
                            , textAnchor "middle"
                            ]
                            [ Svg.text p.label.text ]
                        ]

                    Maybe.Nothing ->
                        []

            else
                []
    in
    renderLabel
