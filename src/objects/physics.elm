module Objects.Physics exposing (checkCollision, linear, update)

import Control.Types exposing (..)
import Objects.Types exposing (..)
import Types exposing (..)


linear : Objects.Types.GameObject -> Float -> Float
linear gO forceInput =
    let
        motion =
            Maybe.withDefault { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 } gO.motion

        physics =
            Maybe.withDefault { forceForward = 0, forceBackward = 0, impacts = [] } gO.physics
    in
    if forceInput == 0 then
        -- Abbremsen
        if motion.speed > 0 then
            motion.speed + physics.forceBackward

        else if motion.speed < 0 then
            motion.speed - physics.forceBackward

        else
            motion.speed

    else if forceInput > 0 then
        -- Beschleunigen
        if (motion.speed + forceInput) <= motion.maxForwardSpeed then
            motion.speed + forceInput

        else
            motion.maxForwardSpeed

    else if forceInput < 0 then
        -- Rückwarts / Bremsen
        if (motion.speed + forceInput) >= -motion.maxBackwardSpeed then
            motion.speed + forceInput

        else
            -motion.maxBackwardSpeed

    else
        motion.speed


update : Model -> Model
update model =
    model


checkCollision : GameObject -> GameObject -> Bool
checkCollision gO1 gO2 =
    let
        detectionHelp : List Collider -> List Collider -> Bool
        detectionHelp l1 l2 =
            case l1 of
                x :: xs ->
                    detection x l2 || detectionHelp xs l2

                [] ->
                    False

        detection : Collider -> List Collider -> Bool
        detection c l =
            case c of
                Rect r ->
                    -- g01 collider
                    case l of
                        x :: xs ->
                            -- check collision c with x
                            calc c x || detection c xs

                        [] ->
                            False

                _ ->
                    False

        calc : Collider -> Collider -> Bool
        calc c1 c2 =
            case c1 of
                Rect r1 ->
                    case r1.position of
                        Just p1 ->
                            case c2 of
                                Rect r2 ->
                                    case r2.position of
                                        Just p2 ->
                                            not
                                                (p2.x
                                                    > (p1.x + r1.width)
                                                    || (p2.x + r2.width)
                                                    < p1.x
                                                    || p2.y
                                                    > (p1.y + r1.height)
                                                    || (p2.y + r2.height)
                                                    < p1.y
                                                )

                                        Maybe.Nothing ->
                                            False

                                _ ->
                                    False

                        Maybe.Nothing ->
                            False

                _ ->
                    False
    in
    detectionHelp gO1.collider gO2.collider
