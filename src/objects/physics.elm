module Objects.Physics exposing (bump, checkCollision, linear, slowDown, update)

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
        -- Auto Abbremsen
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
    let
        controlledObject =
            model.myPlayer.controlledObject

        myPlayer =
            model.myPlayer

        objectList =
            model.map.gameObjects.startLine
                :: model.map.gameObjects.finishLine
                :: (model.map.gameObjects.decor
                        ++ model.map.gameObjects.roads
                        ++ model.map.gameObjects.trigger
                        ++ model.map.gameObjects.background
                   )

        addImpactHelper : Physics -> Maybe Collider -> Physics
        addImpactHelper physics collider =
            case collider of
                Just c ->
                    case c of
                        Rect r ->
                            case r.impactFunction of
                                Just impact ->
                                    { physics | impacts = impact :: physics.impacts }

                                Maybe.Nothing ->
                                    physics

                        _ ->
                            physics

                Maybe.Nothing ->
                    physics

        addImpact : List GameObject -> GameObject -> GameObject
        addImpact l gO =
            case l of
                x :: xs ->
                    case gO.physics of
                        Just p ->
                            addImpact xs { gO | physics = Just (addImpactHelper p (checkCollision gO x)) }

                        Maybe.Nothing ->
                            gO

                [] ->
                    gO

        runImpactHelper : List Impact -> GameObject -> GameObject
        runImpactHelper l gO =
            case l of
                x :: xs ->
                    case x of
                        Impact impact ->
                            runImpactHelper xs (impact.function gO)

                [] ->
                    gO

        updateImpactHelper : List Impact -> List Impact
        updateImpactHelper l =
            case l of
                x :: xs ->
                    case x of
                        Impact impact ->
                            if impact.duration > 0 + model.frequence then
                                Impact { impact | duration = impact.duration - model.frequence } :: updateImpactHelper xs

                            else
                                updateImpactHelper xs

                [] ->
                    l

        updateImpacts : GameObject -> GameObject
        updateImpacts gO =
            case gO.physics of
                Just p ->
                    { gO | physics = Just { p | impacts = updateImpactHelper p.impacts } }

                Maybe.Nothing ->
                    gO

        runImpact : GameObject -> GameObject
        runImpact gO =
            case gO.physics of
                Just p ->
                    runImpactHelper p.impacts gO

                Maybe.Nothing ->
                    gO
    in
    { model | myPlayer = { myPlayer | controlledObject = updateImpacts <| runImpact <| addImpact objectList controlledObject } }


checkCollision : GameObject -> GameObject -> Maybe Collider
checkCollision gO1 gO2 =
    let
        calcRect : Maybe Collider -> Maybe Collider -> Maybe Collider
        calcRect collider1 collider2 =
            case collider1 of
                Just c1 ->
                    case collider2 of
                        Just c2 ->
                            case gO1.position of
                                Just p1 ->
                                    case gO2.position of
                                        Just p2 ->
                                            case c1 of
                                                Rect r1 ->
                                                    case c2 of
                                                        Rect r2 ->
                                                            if
                                                                not
                                                                    ((p2.x + r2.position.x)
                                                                        > (p1.x + r1.position.x + r1.width)
                                                                        || (p2.x + r2.position.x + r2.width)
                                                                        < (p1.x + r1.position.x)
                                                                        || (p2.y + r2.position.y)
                                                                        > (p1.y + r1.position.y + r1.height)
                                                                        || (p2.y + r2.position.y + r2.height)
                                                                        < (p1.y + r1.position.y)
                                                                    )
                                                            then
                                                                Just c2

                                                            else
                                                                Maybe.Nothing

                                                        _ ->
                                                            Maybe.Nothing

                                                _ ->
                                                    Maybe.Nothing

                                        Maybe.Nothing ->
                                            Maybe.Nothing

                                Maybe.Nothing ->
                                    Maybe.Nothing

                        Maybe.Nothing ->
                            Maybe.Nothing

                Maybe.Nothing ->
                    Maybe.Nothing
    in
    if not (gO1.identifier == gO2.identifier) then
        calcRect gO1.collider gO2.collider

    else
        Maybe.Nothing


bump : GameObject -> GameObject
bump gO =
    case gO.motion of
        Just motion ->
            { gO | motion = Just { motion | speed = linear gO -motion.maxForwardSpeed } }

        Maybe.Nothing ->
            gO


slowDown : GameObject -> GameObject
slowDown gO =
    let
        slowDownHelper : Motion -> Float
        slowDownHelper motion =
            if motion.speed > 0 then
                -motion.maxBackwardSpeed

            else
                motion.speed
    in
    case gO.motion of
        Just motion ->
            { gO | motion = Just { motion | speed = slowDownHelper motion } }

        Maybe.Nothing ->
            gO
