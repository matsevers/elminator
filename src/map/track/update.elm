module Map.Track.Update exposing (update)

import Types


update : Types.Model -> Types.Model
update model =
    if model.state == Types.PrepareRace && model.map.options.prepareRaceTime > 0 then
        let
            map =
                model.map

            options =
                map.options

            updatedMap =
                { map
                    | options =
                        { options
                            | prepareRaceTime = map.options.prepareRaceTime - model.frequence
                        }
                }
        in
        { model | map = updatedMap }

    else if model.state == Types.PrepareRace && model.map.options.prepareRaceTime <= 0 then
        { model | state = Types.Running }

    else
        model
