module Ui.Speedometer exposing (element)

import Svg exposing (..)
import Svg.Attributes exposing (..)


width : Int
width =
    250


height : Int
height =
    250


outerBorderWidth : Int
outerBorderWidth =
    5


centeredCircleRadius : Int
centeredCircleRadius =
    20


valueStrokes : List (Svg msg)
valueStrokes =
    let
        angleList : Int -> Int -> Int -> List Int
        angleList counter interval stop =
            if (counter + interval) <= stop then
                counter :: angleList (counter + interval) interval stop

            else
                []

        strokeLength : Int
        strokeLength =
            10

        generateStrokes : List Int -> List (Svg msg)
        generateStrokes l =
            case l of
                px :: xs ->
                    [ Svg.line
                        []
                        []
                    ]
                        ++ generateStrokes xs

                [] ->
                    []
    in
    generateStrokes (angleList 0 20 360)


element : Int -> Int -> Int -> Svg msg
element speed min max =
    Svg.svg [ Svg.Attributes.width (String.fromInt width), Svg.Attributes.height (String.fromInt height) ]
        ([ Svg.circle
            [ cx (String.fromInt (width // 2)), cy (String.fromInt (height // 2)), r (String.fromInt (width // 2)), Svg.Attributes.fill "#9e9e9e" ]
            []
         , Svg.circle
            [ cx (String.fromInt (width // 2)), cy (String.fromInt (height // 2)), r (String.fromInt (width // 2 - outerBorderWidth)), Svg.Attributes.fill "#f2f2f2" ]
            []
         , Svg.circle
            [ cx (String.fromInt (width // 2)), cy (String.fromInt (height // 2)), r (String.fromInt centeredCircleRadius), Svg.Attributes.fill "#e5e5e5" ]
            []
         , Svg.text_ [ x "44%", y "70%", fontSize "22", fontFamily "Arial" ] [ text "km/h" ]
         ]
            ++ valueStrokes
        )
