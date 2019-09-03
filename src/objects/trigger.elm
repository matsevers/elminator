module Objects.Trigger exposing
    ( catchCheckpoint
    , endCheckpoint
    , run
    , startCheckpoint
    )

import Types


run : Types.GameObject -> List Types.GameObject -> Types.Model -> Types.Model
run gO l m =
    case l of
        x :: xs ->
            case x.collider of
                Just collider ->
                    case collider of
                        Types.Rect r ->
                            case r.triggerFunction of
                                Just f ->
                                    f x m

                                Maybe.Nothing ->
                                    run gO xs m

                        _ ->
                            run gO xs m

                Maybe.Nothing ->
                    run gO xs m

        [] ->
            m


startCheckpoint : Types.GameObject -> Types.Model -> Types.Model
startCheckpoint gO m =
    let
        myPlayer =
            m.myPlayer
    in
    { m | myPlayer = { myPlayer | catchedCheckpoints = [ gO ] } }


endCheckpoint : Types.GameObject -> Types.Model -> Types.Model
endCheckpoint gO m =
    let
        myPlayer =
            m.myPlayer

        catchedCheckpoints =
            gO :: myPlayer.catchedCheckpoints

        neededCheckpoints =
            getCheckpoints m.map.gameObjects.trigger

        getCheckpoints : List Types.GameObject -> List Types.GameObject
        getCheckpoints l =
            case l of
                x :: xs ->
                    if x.kind == Types.Checkpoint then
                        x :: getCheckpoints xs

                    else
                        getCheckpoints xs

                [] ->
                    []

        approvedHelper : Types.GameObject -> List Types.GameObject -> Bool
        approvedHelper g l =
            case l of
                x :: xs ->
                    g.identifier == x.identifier || approvedHelper g xs

                [] ->
                    False

        approved : List Types.GameObject -> Bool
        approved l =
            case l of
                x :: xs ->
                    approvedHelper x catchedCheckpoints && approved xs

                [] ->
                    True
    in
    if approved neededCheckpoints then
        if m.myPlayer.currentLab < m.map.options.labs then
            { m
                | myPlayer =
                    { myPlayer
                        | currentLab = myPlayer.currentLab + 1
                        , catchedCheckpoints = []
                    }
            }

        else
            { m | state = Types.Finished }

    else
        m


catchCheckpoint : Types.GameObject -> Types.Model -> Types.Model
catchCheckpoint gO m =
    let
        myPlayer =
            m.myPlayer

        controlledObject =
            myPlayer.controlledObject

        catchedCheckpoints =
            myPlayer.catchedCheckpoints

        snatch : List Types.GameObject -> Bool
        snatch l =
            case l of
                x :: xs ->
                    gO.identifier == x.identifier || snatch xs

                [] ->
                    False

        activateCheckpoint : Types.GameObject
        activateCheckpoint =
            { gO
                | sprite = "assets/decor/checkboxActiveRoadCurve.png"
                , collider = Maybe.Nothing
            }
    in
    if not (snatch catchedCheckpoints) then
        { m
            | myPlayer =
                { myPlayer
                    | catchedCheckpoints =
                        activateCheckpoint :: catchedCheckpoints
                }
        }

    else
        m
