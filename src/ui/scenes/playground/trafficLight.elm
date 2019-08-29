module Ui.Scenes.Playground.TrafficLight exposing (element)

import InitialModel
import Svg
import Svg.Attributes
import Types


width : Int
width =
    150


height : Int
height =
    40


element : Types.Model -> Int -> Int -> List (Svg.Svg msg)
element model px py =
    let
        initialPrepareRaceTime =
            InitialModel.initialModel.map.options.prepareRaceTime

        currentPrepareRactime =
            model.map.options.prepareRaceTime
    in
    if model.state == Types.PrepareRace then
        [ Svg.svg
            [ Svg.Attributes.width (String.fromInt width)
            , Svg.Attributes.height (String.fromInt height)
            , Svg.Attributes.x (String.fromInt px)
            , Svg.Attributes.y (String.fromInt py)
            ]
            [ Svg.rect
                [ Svg.Attributes.x "0"
                , Svg.Attributes.y "0"
                , Svg.Attributes.width (String.fromInt width)
                , Svg.Attributes.height (String.fromInt height)
                , Svg.Attributes.fill "#23262b"
                , Svg.Attributes.rx "15"
                , Svg.Attributes.ry "15"
                ]
                []
            , circle
                ((100 / initialPrepareRaceTime * currentPrepareRactime) > 0)
                (String.fromInt 30)
            , circle
                ((100 / initialPrepareRaceTime * currentPrepareRactime) > 25)
                (String.fromInt 60)
            , circle
                ((100 / initialPrepareRaceTime * currentPrepareRactime) > 50)
                (String.fromInt 90)
            , circle
                ((100 / initialPrepareRaceTime * currentPrepareRactime) > 75)
                (String.fromInt 120)
            ]
        ]

    else
        []


circle : Bool -> String -> Svg.Svg msg
circle activated iCx =
    let
        color : String
        color =
            if activated then
                "#db1f15"

            else
                "#3b3e44"
    in
    Svg.circle
        [ Svg.Attributes.cy (String.fromInt (height // 2))
        , Svg.Attributes.cx iCx
        , Svg.Attributes.r (String.fromInt (height // 3))
        , Svg.Attributes.fill color
        ]
        []
