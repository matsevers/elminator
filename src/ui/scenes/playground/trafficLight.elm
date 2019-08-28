module Ui.Scenes.Playground.TrafficLight exposing (element)

import InitialModel exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (..)


width : Int
width =
    150


height : Int
height =
    40


element : Model -> Int -> Int -> List (Svg msg)
element model px py =
    let
        initialPrepareRaceTime =
            InitialModel.initialModel.map.options.prepareRaceTime

        currentPrepareRactime =
            model.map.options.prepareRaceTime
    in
    if model.state == PrepareRace then
        [ Svg.svg [ Svg.Attributes.width (String.fromInt width), Svg.Attributes.height (String.fromInt height), x (String.fromInt px), y (String.fromInt py) ]
            [ Svg.rect [ x "0", y "0", Svg.Attributes.width (String.fromInt width), Svg.Attributes.height (String.fromInt height), fill "#23262b", rx "15", ry "15" ]
                []
            , circle ((100 / initialPrepareRaceTime * currentPrepareRactime) > 0) (String.fromInt 30)
            , circle ((100 / initialPrepareRaceTime * currentPrepareRactime) > 25) (String.fromInt 60)
            , circle ((100 / initialPrepareRaceTime * currentPrepareRactime) > 50) (String.fromInt 90)
            , circle ((100 / initialPrepareRaceTime * currentPrepareRactime) > 75) (String.fromInt 120)
            ]
        ]

    else
        []


circle : Bool -> String -> Svg msg
circle activated iCx =
    let
        color : String
        color =
            if activated then
                "#db1f15"

            else
                "#3b3e44"
    in
    Svg.circle [ cy (String.fromInt (height // 2)), cx iCx, r (String.fromInt (height // 3)), Svg.Attributes.fill color ] []
