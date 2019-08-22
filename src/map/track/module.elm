module Map.Track.Module exposing (defaultTrack, tracks)

import Map.Track.DustRace
import Map.Track.SummerBreeze
import Map.Types exposing (..)


tracks : List Map.Types.Map
tracks =
    [ Map.Track.DustRace.model, Map.Track.SummerBreeze.model ]


defaultTrack : Map.Types.Map
defaultTrack =
    Map.Track.DustRace.model
