module Ui.Scenes.Playground.Speedometer exposing (element)

import Svg
import Svg.Attributes


width : Int
width =
    200


height : Int
height =
    200


outerBorderWidth : Int
outerBorderWidth =
    width // 50


centeredCircleRadius : Int
centeredCircleRadius =
    width // 20


centerX : Float
centerX =
    toFloat width / 2


centerY : Float
centerY =
    toFloat height / 2


radius : Float
radius =
    toFloat width / 2


valueStrokes : Int -> Int -> List (Svg.Svg msg)
valueStrokes min max =
    let
        angleList : Int -> Int -> Int -> List Int
        angleList counter interval stop =
            if (counter + interval) <= stop + interval then
                counter :: angleList (counter + interval) interval stop

            else
                []

        strokeLength : Int
        strokeLength =
            10

        generateStrokes : List Int -> Int -> Int -> String -> List (Svg.Svg msg)
        generateStrokes list sWidth sLength sColor =
            case list of
                px :: pxs ->
                    [ Svg.line
                        [ Svg.Attributes.stroke sColor
                        , Svg.Attributes.strokeWidth (String.fromInt sWidth)
                        , Svg.Attributes.x1
                            (String.fromInt
                                (round (centerX + sin (degrees (toFloat px)) * (radius - toFloat sLength)))
                            )
                        , Svg.Attributes.y1
                            (String.fromInt
                                (round (centerY - cos (degrees (toFloat px)) * (radius - toFloat sLength)))
                            )
                        , Svg.Attributes.x2
                            (String.fromInt
                                (round (centerX + sin (degrees (toFloat px)) * (radius - toFloat outerBorderWidth)))
                            )
                        , Svg.Attributes.y2
                            (String.fromInt
                                (round (centerY - cos (degrees (toFloat px)) * (radius - toFloat outerBorderWidth)))
                            )
                        ]
                        []
                    ]
                        ++ generateStrokes pxs sWidth sLength sColor

                [] ->
                    []
    in
    generateStrokes (angleList -100 40 100) 5 30 "#c6c6c6"
        ++ generateStrokes (angleList -100 5 60) 2 20 "#c6c6c6"
        ++ generateStrokes (angleList 65 5 95) 2 20 "#af1616"


pin : Int -> Int -> Int -> Int -> Int -> List (Svg.Svg msg)
pin speed minSpeed maxSpeed startAngle endAngle =
    let
        calcSpeedDegree : Float
        calcSpeedDegree =
            let
                calcSpeedPercent : Float
                calcSpeedPercent =
                    toFloat speed * 100 / toFloat (maxSpeed - minSpeed)
            in
            toFloat (endAngle - startAngle) * calcSpeedPercent / 100 - toFloat 100
    in
    [ Svg.line
        [ Svg.Attributes.stroke "#c91616"
        , Svg.Attributes.strokeWidth (String.fromInt (width // 25))
        , Svg.Attributes.x1 (String.fromFloat centerX)
        , Svg.Attributes.y1 (String.fromFloat centerY)
        , Svg.Attributes.x2 (String.fromInt (round (centerX + sin (degrees calcSpeedDegree) * radius * 0.75)))
        , Svg.Attributes.y2 (String.fromInt (round (centerY - cos (degrees calcSpeedDegree) * radius * 0.75)))
        ]
        []
    , Svg.circle
        [ Svg.Attributes.cx (String.fromInt (round centerX))
        , Svg.Attributes.cy (String.fromInt (round centerY))
        , Svg.Attributes.r (String.fromInt centeredCircleRadius)
        , Svg.Attributes.fill "#af1616"
        ]
        []
    ]


element : Int -> Int -> Int -> Svg.Svg msg
element currentSpeed minSpeed maxSpeed =
    Svg.svg
        [ Svg.Attributes.width (String.fromInt width)
        , Svg.Attributes.height (String.fromInt height)
        ]
        ([ Svg.circle
            [ Svg.Attributes.cx (String.fromInt (width // 2))
            , Svg.Attributes.cy (String.fromInt (height // 2))
            , Svg.Attributes.r (String.fromInt (width // 2))
            , Svg.Attributes.fill "#9e9e9e"
            ]
            []
         , Svg.circle
            [ Svg.Attributes.cx (String.fromInt (width // 2))
            , Svg.Attributes.cy (String.fromInt (height // 2))
            , Svg.Attributes.r (String.fromInt (width // 2 - outerBorderWidth))
            , Svg.Attributes.fill "#f2f2f2"
            ]
            []
         , Svg.text_
            [ Svg.Attributes.x "50%"
            , Svg.Attributes.y "85%"
            , Svg.Attributes.fontSize "22"
            , Svg.Attributes.fontFamily "Arial"
            , Svg.Attributes.textAnchor "middle"
            ]
            [ Svg.text "km/h" ]
         , Svg.text_
            [ Svg.Attributes.x "50%"
            , Svg.Attributes.y "75%"
            , Svg.Attributes.fontSize "22"
            , Svg.Attributes.fontFamily "Arial"
            , Svg.Attributes.textAnchor "middle"
            ]
            [ Svg.text (String.fromInt (abs currentSpeed)) ]
         ]
            ++ valueStrokes minSpeed maxSpeed
            ++ pin (abs currentSpeed) minSpeed maxSpeed -100 100
        )
