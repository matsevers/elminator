module Objects.Cars.Taxi exposing (model)

import Objects.Types exposing (..)


model : GameObject
model =
    { identifier = "Taxi"
    , size = { height = 32, width = 32 }
    , position = Just { x = 450, y = 100 }
    , sprite = "assets/cars/taxi.png"
    , collider =
        Just
            (Rect
                { width = 8
                , height = 8
                , position = { x = 12, y = 12 }
                , impactFunction = Maybe.Nothing
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
