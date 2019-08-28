module Objects.Vehicle.Module exposing (defaultVehicle, vehicles)

import Objects.Vehicle.Ambulance
import Objects.Vehicle.Police
import Objects.Vehicle.Taxi
import Types


vehicles : List Types.GameObject
vehicles =
    [ Objects.Vehicle.Ambulance.model
    , Objects.Vehicle.Police.model
    , Objects.Vehicle.Taxi.model
    ]


defaultVehicle : Types.GameObject
defaultVehicle =
    Objects.Vehicle.Ambulance.model
