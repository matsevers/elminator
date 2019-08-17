module Objects.Physics exposing (checkCollision, linear)

import Control.Types exposing (..)
import Objects.Types exposing (..)


linear : Objects.Types.GameObject -> Float -> Float
linear gO forceInput =
    if forceInput == 0 then
        -- Abbremsen
        if gO.motion.speed > 0 then
            gO.motion.speed + gO.physics.forceBackward

        else if gO.motion.speed < 0 then
            gO.motion.speed - gO.physics.forceBackward

        else
            gO.motion.speed

    else if forceInput > 0 then
        -- Beschleunigen
        if (gO.motion.speed + forceInput) <= gO.motion.maxForwardSpeed then
            gO.motion.speed + forceInput

        else
            gO.motion.maxForwardSpeed

    else if forceInput < 0 then
        -- Rückwarts / Bremsen
        if (gO.motion.speed + forceInput) >= -gO.motion.maxBackwardSpeed then
            gO.motion.speed + forceInput

        else
            -gO.motion.maxBackwardSpeed

    else
        gO.motion.speed


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
            -- case l of
            --     x :: xs ->
            --         -- check collision c with x
            --         calc c x || detection c xs
            --     [] ->
            --         False
            case c of
                ColliderUnset ->
                    False

                Rect r ->
                    case r.position of
                        Position p ->
                            -- g01 collider
                            case l of
                                x :: xs ->
                                    -- check collision c with x
                                    calc c x || detection c xs

                                [] ->
                                    False

                        _ ->
                            False

                _ ->
                    False

        calc : Collider -> Collider -> Bool
        calc c1 c2 =
            case gO1.position of
                PositionUnset ->
                    False

                Position pos1 ->
                    case gO2.position of
                        PositionUnset ->
                            False

                        Position pos2 ->
                            not
                                (pos2.x
                                    > (pos1.x + gO1.size.width)
                                    || (pos2.x + gO2.size.width)
                                    < pos1.x
                                    || pos2.y
                                    > (pos1.y + gO1.size.height)
                                    || (pos2.y + gO2.size.height)
                                    < pos1.y
                                )
    in
    case gO1.position of
        PositionUnset ->
            False

        Position pos1 ->
            case gO2.position of
                PositionUnset ->
                    False

                Position pos2 ->
                    detectionHelp gO1.collider gO2.collider
