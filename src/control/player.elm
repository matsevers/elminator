module Control.Player exposing (applyInput, convertInputToAngle, convertInputToForce, update)

import Control.Global exposing (..)
import Objects.Manager exposing (..)
import Objects.Physics exposing (..)
import Types exposing (..)


applyInput : Model -> KeyEvent -> Action -> ( Model, Cmd Msg )
applyInput model event action =
    let
        myPlayer =
            model.myPlayer

        storedKeys =
            myPlayer.storedKeys
    in
    case model.state of
        Running ->
            case event of
                Pressed ->
                    case action of
                        Forward ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | forward = action } } }, Cmd.none )

                        Backward ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | backward = action } } }, Cmd.none )

                        Left ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | left = action } } }, Cmd.none )

                        Right ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | right = action } } }, Cmd.none )

                        _ ->
                            ( model, Cmd.none )

                Released ->
                    case action of
                        Forward ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | forward = Types.Nothing } } }, Cmd.none )

                        Backward ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | backward = Types.Nothing } } }, Cmd.none )

                        Left ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | left = Types.Nothing } } }, Cmd.none )

                        Right ->
                            ( { model | myPlayer = { myPlayer | storedKeys = { storedKeys | right = Types.Nothing } } }, Cmd.none )

                        _ ->
                            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


convertInputToAngle : List Action -> Int
convertInputToAngle l =
    let
        angle =
            5
    in
    case l of
        x :: xs ->
            case x of
                Left ->
                    -angle + convertInputToAngle xs

                Right ->
                    angle + convertInputToAngle xs

                _ ->
                    0 + convertInputToAngle xs

        [] ->
            0


convertInputToForce : List Action -> Float
convertInputToForce l =
    case l of
        [] ->
            0

        x :: xs ->
            case x of
                Forward ->
                    2 + convertInputToForce xs

                Backward ->
                    -1 + convertInputToForce xs

                _ ->
                    0 + convertInputToForce xs


update : Model -> Model
update model =
    let
        myPlayer =
            model.myPlayer

        gO =
            myPlayer.controlledObject

        listKeys =
            [ myPlayer.storedKeys.forward, myPlayer.storedKeys.backward, myPlayer.storedKeys.left, myPlayer.storedKeys.right ]
    in
    if model.state == Running then
        case gO.position of
            Just p ->
                case gO.motion of
                    Just m ->
                        { model
                            | myPlayer =
                                { myPlayer
                                    | controlledObject =
                                        Objects.Manager.position
                                            (Just
                                                { x = p.x + round (sin (degrees (toFloat gO.rotate)) * m.speed / model.frequence * 4)
                                                , y = p.y - round (cos (degrees (toFloat gO.rotate)) * m.speed / model.frequence * 4)
                                                }
                                            )
                                        <|
                                            counterforce (convertInputToForce listKeys) <|
                                                autoBrake (convertInputToForce listKeys) <|
                                                    acceleration (convertInputToForce listKeys) <|
                                                        Objects.Manager.rotate (modBy 360 (gO.rotate + convertInputToAngle listKeys)) gO
                                }
                        }

                    Maybe.Nothing ->
                        model

            Maybe.Nothing ->
                model

    else
        model
