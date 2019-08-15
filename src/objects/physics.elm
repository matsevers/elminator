module Objects.Physics exposing (linear)

import Control.Types exposing (..)
import Objects.Types exposing (..)


linear : Objects.Types.GameObject msg -> Float -> Float
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
