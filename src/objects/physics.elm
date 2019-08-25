module Objects.Physics exposing (..)

import List exposing (..)
import Types exposing (..)


update : Model -> Model
update model =
    let
        myPlayer =
            model.myPlayer

        controlledObject =
            model.myPlayer.controlledObject

        objectList =
            model.map.gameObjects.trigger
                ++ model.map.gameObjects.decor
                ++ model.map.gameObjects.roads
                ++ model.map.gameObjects.background
        
        approvedCollision = { trigger = (checkCollision controlledObject model.map.gameObjects.trigger) ,impacts = (checkCollision controlledObject objectList)}

    in
    { model
        | myPlayer =
            { myPlayer
                | controlledObject =
                    updateImpacts model <|
                        runImpact <|
                            addImpact approvedCollision.impacts controlledObject
            }
    }

checkCollision : GameObject -> List (GameObject) -> List (GameObject)
checkCollision gO l =
    let
        helper : GameObject -> GameObject -> Maybe GameObject
        helper gO1 gO2 =
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
                                            --Just c2
                                            Just gO2

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
             

    in
    case l of 
        x :: xs -> case helper gO x of 
                    Just gameObject -> gameObject :: checkCollision gO xs 
                    Maybe.Nothing -> checkCollision gO xs             
                        
        [] -> []
         





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
                            not (i.identifier == "background") && i.overrideBackgroundImpact
            in
            if length list > 1 then
                List.filter filterBackgroundImpact list

            else
                list

        addImpactHelper : Physics -> Maybe Collider -> Physics
        addImpactHelper physics collider =
            let
                updateUnmodifiedGameobject : Impact -> Impact
                updateUnmodifiedGameobject impact =
                    case impact of
                        Impact i ->
                            Impact { i | unmodifiedObject = Just gO }
            in
            case collider of
                Just c ->
                    case c of
                        Rect r ->
                            case r.impactFunction of
                                Just impact ->
                                    { physics | impacts = checkToRemoveBackgroundImpact <| (updateUnmodifiedGameobject impact :: physics.impacts) }

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
                Just p -> addImpact xs { gO | physics = Just (addImpactHelper p x.collider) }                    

                Maybe.Nothing ->
                    gO

        [] ->
            gO


updateImpacts : Model -> GameObject -> GameObject
updateImpacts model gO =
    let
        reduceDuration : Impact -> Impact
        reduceDuration impact =
            case impact of
                Impact i ->
                    if i.duration > 0 then
                        Impact { i | duration = i.duration - model.frequence }

                    else
                        impact

        removeExpiredImpacts : Impact -> Bool
        removeExpiredImpacts impact =
            case impact of
                Impact i ->
                    i.duration > 0
    in
    case gO.physics of
        Just p ->
            { gO | physics = Just { p | impacts = filter removeExpiredImpacts (map reduceDuration p.impacts) } }

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
                            case impact.function of
                                Just f ->
                                    iterateThroughImpact xs (f (Impact impact) gameObject)

                                Maybe.Nothing ->
                                    gameObject

                [] ->
                    gameObject
    in
    case gO.physics of
        Just p ->
            iterateThroughImpact p.impacts gO

        Maybe.Nothing ->
            gO


-- Speed functions


acceleration : Float -> GameObject -> GameObject
acceleration acc gO =
    case gO.motion of
        Just motion ->
            restrictSpeed <| { gO | motion = Just { motion | speed = motion.speed + acc } }

        Maybe.Nothing ->
            gO


autoBrake : Float -> GameObject -> GameObject
autoBrake force gO =
    if force == 0 then
        case gO.motion of
            Just motion ->
                overwriteBrake ((motion.maxForwardSpeed + motion.maxBackwardSpeed) / 60) gO

            Maybe.Nothing ->
                gO

    else
        gO


brakeTo : Float -> GameObject -> GameObject
brakeTo limit gO =
    case gO.motion of
        Just motion ->
            let
                brakeFactor =
                    motion.speed / 7.5
            in
            if motion.speed >= limit + brakeFactor then
                setSpeed (motion.speed - brakeFactor) gO

            else if motion.speed >= limit then
                setSpeed limit gO

            else
                gO

        Maybe.Nothing ->
            gO


overwriteBrake : Float -> GameObject -> GameObject
overwriteBrake bra gO =
    case gO.motion of
        Just motion ->
            if (motion.speed - bra) > 0 then
                setSpeed (motion.speed - bra) gO

            else if (motion.speed + bra) < 0 then
                setSpeed (motion.speed + bra) gO

            else
                setSpeed 0 gO

        Maybe.Nothing ->
            gO


counterforce : Float -> GameObject -> GameObject
counterforce force gO =
    case gO.motion of
        Just motion ->
            -- brake if player triggers forward but car drives backward
            if force >= 1 && motion.speed < 0 then
                autoBrake 0 gO
                -- brake if player triggers backward but car drives forward

            else if force <= -1 && motion.speed > 0 then
                autoBrake 0 gO

            else
                gO

        Maybe.Nothing ->
            gO



-- Impact Function


getDirectionFromGameObject : GameObject -> Float
getDirectionFromGameObject gO =
    case gO.motion of
        Just motion ->
            if motion.speed > 0 then
                1

            else if motion.speed < 0 then
                -1

            else
                0

        Maybe.Nothing ->
            0


getDirectionFromImpact : Impact -> Float
getDirectionFromImpact impact =
    case impact of
        Impact i ->
            case i.unmodifiedObject of
                Just gameObject ->
                    getDirectionFromGameObject gameObject

                Maybe.Nothing ->
                    0


setSpeed : Float -> GameObject -> GameObject
setSpeed speed gO =
    case gO.motion of
        Just motion ->
            { gO | motion = Just { motion | speed = speed } }

        Maybe.Nothing ->
            gO


overwriteSpeedLimits : Float -> Float -> GameObject -> GameObject
overwriteSpeedLimits maxForwardSpeed maxBackwardSpeed gO =
    case gO.motion of
        Just motion ->
            if motion.speed > maxForwardSpeed then
                setSpeed maxForwardSpeed gO

            else if motion.speed < -maxBackwardSpeed then
                setSpeed -maxBackwardSpeed gO

            else
                setSpeed motion.speed gO

        Maybe.Nothing ->
            gO


restrictSpeed : GameObject -> GameObject
restrictSpeed gO =
    case gO.motion of
        Just motion ->
            overwriteSpeedLimits motion.maxForwardSpeed motion.maxBackwardSpeed gO

        Maybe.Nothing ->
            gO


bump : Impact -> GameObject -> GameObject
bump impact gO =
    if getDirectionFromImpact impact > 0 then
        overwriteSpeedLimits 40 20 <| setSpeed -80 gO

    else if getDirectionFromImpact impact < 0 then
        overwriteSpeedLimits 20 20 <| setSpeed 80 gO

    else
        gO


slowDown : Impact -> GameObject -> GameObject
slowDown impact gO =
    -- overwriteSpeedLimits 20 20 gO
    brakeTo 20 gO
