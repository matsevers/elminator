module Objects.Vehicle.Ambulance exposing (model)

import Types


model : Types.GameObject
model =
    { identifier = "Ambulance"
    , kind = Types.Car
    , size = { height = 32, width = 32 }
    , position = Just { x = 450, y = 100 }
    , sprite = "assets/cars/ambulance.png"
    , spriteMinimap = Just "assets/cars/ambulance.png"
    , collider =
        Just
            (Types.Rect
                { width = 8
                , height = 8
                , position = { x = 12, y = 12 }
                , impactFunction = Maybe.Nothing
                , triggerFunction = Maybe.Nothing
                }
            )
    , rotate = 90
    , motion =
        Just
            { speed = 0
            , maxForwardSpeed = 80
            , maxBackwardSpeed = 20
            }
    , physics =
        Just
            { forceForward = 2
            , forceBackward = -1
            , impacts = []
            }
    }
