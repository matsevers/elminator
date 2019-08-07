module Objects.Render exposing (update)

import Objects.Manager exposing (GameObject)
import Svg exposing (..)
import Svg.Attributes exposing (..)


update : GameObject -> List (Svg msg)
update x =
    Svg.image
        [ Svg.Attributes.x
        , Svg.Attributes.y (String.fromInt y)
        , Svg.Attributes.width (String.fromInt 16)
        , Svg.Attributes.height (String.fromInt 16)
        , Svg.Attributes.xlinkHref "assets/carAbulance.png"
        ]
        []
