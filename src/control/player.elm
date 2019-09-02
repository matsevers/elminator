module Control.Player exposing (applyInput, keyDecoder, update)

import Json.Decode
import Objects.Module
import Objects.Physics
import Types


update : Types.Model -> Types.Model
update model =
    let
        myPlayer =
            model.myPlayer

        gO =
            myPlayer.controlledObject

        listKeys =
            [ myPlayer.storedKeys.forward
            , myPlayer.storedKeys.backward
            , myPlayer.storedKeys.left
            , myPlayer.storedKeys.right
            ]

        calcX : Types.Position -> Types.Motion -> Int
        calcX p m =
            p.x
                + round
                    (sin (degrees gO.rotate)
                        * m.speed
                        / model.frequence
                        * 4
                    )

        calcY : Types.Position -> Types.Motion -> Int
        calcY p m =
            p.y
                - round
                    (cos (degrees gO.rotate)
                        * m.speed
                        / model.frequence
                        * 4
                    )
    in
    if model.state == Types.Running then
        case gO.position of
            Just p ->
                case gO.motion of
                    Just m ->
                        { model
                            | myPlayer =
                                { myPlayer
                                    | controlledObject =
                                        Objects.Module.position
                                            (Just
                                                { x = calcX p m
                                                , y = calcY p m
                                                }
                                            )
                                        <|
                                            Objects.Physics.counterforce (convertInputToForce listKeys) <|
                                                Objects.Physics.autoBrake (convertInputToForce listKeys) <|
                                                    Objects.Physics.acceleration (convertInputToForce listKeys) <|
                                                        Objects.Module.rotate (toFloat (modBy 360 (round (gO.rotate + convertInputToAngle listKeys model.myPlayer)))) gO
                                    , time = myPlayer.time + round model.frequence
                                }
                        }

                    Maybe.Nothing ->
                        model

            Maybe.Nothing ->
                model

    else
        model


applyInput : Types.Model -> Types.KeyEvent -> Types.Action -> ( Types.Model, Cmd Types.Msg )
applyInput model event action =
    let
        myPlayer =
            model.myPlayer

        storedKeys =
            myPlayer.storedKeys
    in
    case model.state of
        Types.Running ->
            case event of
                Types.Pressed ->
                    case action of
                        Types.Forward ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | forward = action
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        Types.Backward ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | backward = action
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        Types.Left ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | left = action
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        Types.Right ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | right = action
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        _ ->
                            ( model, Cmd.none )

                Types.Released ->
                    case action of
                        Types.Forward ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | forward = Types.Nothing
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        Types.Backward ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | backward = Types.Nothing
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        Types.Left ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | left = Types.Nothing
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        Types.Right ->
                            ( { model
                                | myPlayer =
                                    { myPlayer
                                        | storedKeys =
                                            { storedKeys
                                                | right = Types.Nothing
                                            }
                                    }
                              }
                            , Cmd.none
                            )

                        _ ->
                            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


convertInputToAngle : List Types.Action -> Types.Player -> Float
convertInputToAngle l p =
    let
        angle =
            case p.controlledObject.motion of
                Just m ->
                    m.steeringAngle

                _ ->
                    0
    in
    case l of
        x :: xs ->
            case x of
                Types.Left ->
                    -angle + convertInputToAngle xs p

                Types.Right ->
                    angle + convertInputToAngle xs p

                _ ->
                    0 + convertInputToAngle xs p

        [] ->
            0


convertInputToForce : List Types.Action -> Float
convertInputToForce l =
    case l of
        [] ->
            0

        x :: xs ->
            case x of
                Types.Forward ->
                    2 + convertInputToForce xs

                Types.Backward ->
                    -1 + convertInputToForce xs

                _ ->
                    0 + convertInputToForce xs


keyDecoder : Json.Decode.Decoder Types.Action
keyDecoder =
    Json.Decode.map toKey (Json.Decode.field "key" Json.Decode.string)


toKey : String -> Types.Action
toKey val =
    case val of
        "w" ->
            Types.Forward

        "a" ->
            Types.Left

        "s" ->
            Types.Backward

        "d" ->
            Types.Right

        _ ->
            Types.Nothing
