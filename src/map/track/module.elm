module Map.Track.Module exposing (defaultTrack, tracks, update)

import Map.Track.DustRace
import Map.Track.SummerBreeze
import Map.Track.Update
import Types


tracks : List Types.Map
tracks =
    [ Map.Track.DustRace.model, Map.Track.SummerBreeze.model ]


defaultTrack : Types.Map
defaultTrack =
    Map.Track.DustRace.model


update =
    Map.Track.Update.update
