module Objects.Vehicle.Police exposing (model)

import Types exposing (..)


model : GameObject
model =
    { identifier = "Police"
    , kind = Types.Car
    , size = { height = 32, width = 32 }
    , position = Just { x = 450, y = 100 }
    , sprite = "assets/cars/police.png"
    , collider =
        Just
            (Rect
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
            { forceForward = 3
            , forceBackward = -1
            , impacts = []
            }
    }
