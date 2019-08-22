module Objects.Vehicle.Module exposing (defaultVehicle, vehicles)

import Objects.Types exposing (..)
import Objects.Vehicle.Ambulance
import Objects.Vehicle.Police
import Objects.Vehicle.Taxi


vehicles : List Objects.Types.GameObject
vehicles =
    [ Objects.Vehicle.Ambulance.model
    , Objects.Vehicle.Police.model
    , Objects.Vehicle.Taxi.model
    ]


defaultVehicle : Objects.Types.GameObject
defaultVehicle =
    Objects.Vehicle.Ambulance.model
