module Objects.Physics exposing (bump, checkCollision, linear, slowDown, update)

import Control.Types exposing (..)
import List exposing (..)
import Objects.Types exposing (..)
import Types exposing (..)


update : Model -> Model
update model =
    let
        myPlayer =
            model.myPlayer

        controlledObject =
            model.myPlayer.controlledObject

        objectList =
            model.map.gameObjects.startLine
                :: model.map.gameObjects.finishLine
                :: (model.map.gameObjects.decor
                        ++ model.map.gameObjects.roads
                        ++ model.map.gameObjects.trigger
                        ++ model.map.gameObjects.background
                   )
    in
    { model
        | myPlayer =
            { myPlayer
                | controlledObject =
                    updateImpacts model <|
                        runImpact <|
                            addImpact objectList controlledObject
            }
    }


addImpact : List GameObject -> GameObject -> GameObject
addImpact l gO =
    let
        checkToRemoveBackgroundImpact : List Impact -> List Impact
        checkToRemoveBackgroundImpact list =
            let
                filterBackgroundImpact : Impact -> Bool
                filterBackgroundImpact impact =
                    case impact of
                        Impact i ->
                            not (i.trigger == "background") && i.overrideBackgroundImpact
            in
            if length list > 1 then
                List.filter filterBackgroundImpact list

            else
                list

        addImpactHelper : Physics -> Maybe Collider -> Physics
        addImpactHelper physics collider =
            case collider of
                Just c ->
                    case c of
                        Rect r ->
                            case r.impactFunction of
                                Just impact ->
                                    { physics | impacts = checkToRemoveBackgroundImpact <| impact :: physics.impacts }

                                Maybe.Nothing ->
                                    physics

                        _ ->
                            physics

                Maybe.Nothing ->
                    physics
    in
    case l of
        x :: xs ->
            case gO.physics of
                Just p ->
                    addImpact xs { gO | physics = Just (addImpactHelper p (checkCollision gO x)) }

                Maybe.Nothing ->
                    gO

        [] ->
            gO


updateImpacts : Model -> GameObject -> GameObject
updateImpacts model gO =
    let
        updateImpact : Impact -> Impact
        updateImpact impact =
            case impact of
                Impact i ->
                    if i.duration > 0 + model.frequence then
                        Impact { i | duration = i.duration - model.frequence }

                    else
                        impact
    in
    case gO.physics of
        Just p ->
            { gO | physics = Just { p | impacts = map updateImpact p.impacts } }

        Maybe.Nothing ->
            gO


runImpact : GameObject -> GameObject
runImpact gO =
    let
        iterateThroughImpact : List Impact -> GameObject -> GameObject
        iterateThroughImpact l gameObject =
            case l of
                x :: xs ->
                    case x of
                        Impact impact ->
                            iterateThroughImpact xs (impact.function gameObject)

                [] ->
                    gameObject
    in
    case gO.physics of
        Just p ->
            iterateThroughImpact p.impacts gO

        Maybe.Nothing ->
            gO


checkCollision : GameObject -> GameObject -> Maybe Collider
checkCollision gO1 gO2 =
    if not (gO1.identifier == gO2.identifier) then
        case ( gO1.collider, gO2.collider ) of
            ( Just c1, Just c2 ) ->
                case ( gO1.position, gO2.position ) of
                    ( Just p1, Just p2 ) ->
                        case ( c1, c2 ) of
                            ( Rect r1, Rect r2 ) ->
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

            _ ->
                Maybe.Nothing

    else
        Maybe.Nothing


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


bump : GameObject -> GameObject
bump gO =
    case gO.motion of
        Just motion ->
            { gO | motion = Just { motion | speed = linear gO -motion.maxForwardSpeed } }

        Maybe.Nothing ->
            gO


slowDown : GameObject -> GameObject
slowDown gO =
    case gO.motion of
        Just motion ->
            if motion.speed > 20 then
                { gO | motion = Just { motion | speed = motion.speed - 8 } }

            else
                { gO | motion = Just { motion | speed = motion.speed } }

        Maybe.Nothing ->
            gO
