module Objects.Tiles.Decor exposing (finishLine, platformBlue, startLine)

import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


startLine : GameObject msg
startLine =
    { identifier = "StartLine"
    , position = None
    , collider = Svg.rect [] []
    , sprite = ""
    , size = { height = 20, width = 64 }
    , rotate = 0
    , speed = 0
    }


finishLine : GameObject msg
finishLine =
    { identifier = "FinishLine"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Finish.png"
    , size = { height = 20, width = 64 }
    , rotate = 0
    , speed = 0
    }


platformBlue : GameObject msg
platformBlue =
    { identifier = "PlatformBlue"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Pavilion_01.png"
    , size = { height = 64, width = 128 }
    , rotate = 0
    , speed = 0
    }
