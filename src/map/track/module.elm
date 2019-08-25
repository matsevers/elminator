module Map.Track.Module exposing (defaultTrack, tracks)

import Map.Track.DustRace
import Map.Track.SummerBreeze
import Types exposing (..)


tracks : List Types.Map
tracks =
    [ Map.Track.DustRace.model, Map.Track.SummerBreeze.model ]


defaultTrack : Types.Map
defaultTrack =
    Map.Track.DustRace.model
