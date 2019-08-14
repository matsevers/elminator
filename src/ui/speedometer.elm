module Ui.Speedometer exposing (element)

import Svg exposing (..)
import Svg.Attributes exposing (..)


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


valueStrokes : Int -> Int -> List (Svg msg)
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

        generateStrokes : List Int -> Int -> Int -> String -> List (Svg msg)
        generateStrokes list sWidth sLength sColor =
            case list of
                px :: pxs ->
                    [ Svg.line
                        [ stroke sColor
                        , strokeWidth (String.fromInt sWidth)
                        , x1 (String.fromInt (round (centerX + sin (degrees (toFloat px)) * (radius - toFloat sLength))))
                        , y1 (String.fromInt (round (centerY - cos (degrees (toFloat px)) * (radius - toFloat sLength))))
                        , x2 (String.fromInt (round (centerX + sin (degrees (toFloat px)) * (radius - toFloat outerBorderWidth))))
                        , y2 (String.fromInt (round (centerY - cos (degrees (toFloat px)) * (radius - toFloat outerBorderWidth))))
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


pin : Int -> Int -> Int -> Int -> Int -> List (Svg msg)
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
        [ stroke "#c91616"
        , strokeWidth (String.fromInt (width // 25))
        , x1 (String.fromFloat centerX)
        , y1 (String.fromFloat centerY)
        , x2 (String.fromInt (round (centerX + sin (degrees calcSpeedDegree) * radius * 0.75)))
        , y2 (String.fromInt (round (centerY - cos (degrees calcSpeedDegree) * radius * 0.75)))
        ]
        []
    , Svg.circle
        [ cx (String.fromInt (round centerX))
        , cy (String.fromInt (round centerY))
        , r (String.fromInt centeredCircleRadius)
        , Svg.Attributes.fill "#af1616"
        ]
        []
    ]



--
-- Svg.text_
--    [ x (String.fromInt (round (centerX + sin (degrees (toFloat px)) * (radius - toFloat 50) - 7)))
--    , y (String.fromInt (round (centerY - cos (degrees (toFloat px)) * (radius - toFloat 50))))
--    , color "red"
--    ]
--    [ text (String.fromInt px) ]


element : Int -> Int -> Int -> Svg msg
element currentSpeed minSpeed maxSpeed =
    Svg.svg [ Svg.Attributes.width (String.fromInt width), Svg.Attributes.height (String.fromInt height) ]
        ([ Svg.circle
            [ cx (String.fromInt (width // 2)), cy (String.fromInt (height // 2)), r (String.fromInt (width // 2)), Svg.Attributes.fill "#9e9e9e" ]
            []
         , Svg.circle
            [ cx (String.fromInt (width // 2)), cy (String.fromInt (height // 2)), r (String.fromInt (width // 2 - outerBorderWidth)), Svg.Attributes.fill "#f2f2f2" ]
            []
         , Svg.text_ [ x "50%", y "85%", fontSize "22", fontFamily "Arial", textAnchor "middle" ] [ text "km/h" ]
         , Svg.text_ [ x "50%", y "75%", fontSize "22", fontFamily "Arial", textAnchor "middle" ] [ text (String.fromInt currentSpeed) ]
         ]
            ++ valueStrokes minSpeed maxSpeed
            ++ pin currentSpeed minSpeed maxSpeed -100 100
        )
