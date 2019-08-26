module Objects.Trigger exposing (catchCheckpoint, endCheckpoint, runTrigger, startCheckpoint)

import Types exposing (..)


runTrigger : GameObject -> List GameObject -> Model -> Model
runTrigger gO l m =
    case l of
        x :: xs ->
            case x.collider of
                Just collider ->
                    case collider of
                        Rect r ->
                            case r.triggerFunction of
                                Just f ->
                                    f x m

                                Maybe.Nothing ->
                                    runTrigger gO xs m

                        _ ->
                            runTrigger gO xs m

                Maybe.Nothing ->
                    runTrigger gO xs m

        [] ->
            m



-- functions for GameObjects.collider


startCheckpoint : GameObject -> Model -> Model
startCheckpoint gO m =
    let
        myPlayer =
            m.myPlayer
    in
    { m | myPlayer = { myPlayer | catchedCheckpoints = [ gO ] } }


endCheckpoint : GameObject -> Model -> Model
endCheckpoint gO m =
    let
        myPlayer =
            m.myPlayer

        catchedCheckpoints =
            gO :: myPlayer.catchedCheckpoints

        neededCheckpoints =
            getCheckpoints m.map.gameObjects.trigger

        getCheckpoints : List GameObject -> List GameObject
        getCheckpoints l =
            case l of
                x :: xs ->
                    if x.kind == Types.Checkpoint then
                        x :: getCheckpoints xs

                    else
                        getCheckpoints xs

                [] ->
                    []

        approvedHelper : GameObject -> List GameObject -> Bool
        approvedHelper g l =
            case l of
                x :: xs ->
                    g.identifier == x.identifier || approvedHelper g xs

                [] ->
                    False

        approved : List GameObject -> Bool
        approved l =
            case l of
                x :: xs ->
                    approvedHelper x catchedCheckpoints && approved xs

                [] ->
                    True
    in
    if Debug.log "finish " (approved neededCheckpoints) then
        --if (approved neededCheckpoints) then
        if m.myPlayer.currentLab < m.map.options.labs then
            { m | myPlayer = { myPlayer | currentLab = myPlayer.currentLab + 1, catchedCheckpoints = [] } }

        else
            { m | state = Finished }

    else
        m


catchCheckpoint : GameObject -> Model -> Model
catchCheckpoint gO m =
    let
        myPlayer =
            m.myPlayer

        controlledObject =
            myPlayer.controlledObject

        catchedCheckpoints =
            myPlayer.catchedCheckpoints

        snatch : List GameObject -> Bool
        snatch l =
            case l of
                x :: xs ->
                    gO.identifier == x.identifier || snatch xs

                [] ->
                    False

        activateCheckpoint : GameObject
        activateCheckpoint =
            { gO | sprite = "assets/decor/checkboxActiveRoadCurve.png", collider = Maybe.Nothing }
    in
    if not (snatch catchedCheckpoints) then
        { m | myPlayer = { myPlayer | catchedCheckpoints = activateCheckpoint :: catchedCheckpoints } }

    else
        m
