module Objects.Tiles.Decor exposing (bush1, bush2, finishLine, platformBlue, rock1, rock2, startLine, tree1, tree2)

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
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


finishLine : GameObject msg
finishLine =
    { identifier = "FinishLine"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Finish.png"
    , size = { height = 20, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


platformBlue : GameObject msg
platformBlue =
    { identifier = "PlatformBlue"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Pavilion_01.png"
    , size = { height = 64, width = 128 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


bush1 : GameObject msg
bush1 =
    { identifier = "Bush1"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Bush_01.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


bush2 : GameObject msg
bush2 =
    { identifier = "Bush2"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Bush_02.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


rock1 : GameObject msg
rock1 =
    { identifier = "Rock1"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Rock_01.png"
    , size = { height = 32, width = 32 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


rock2 : GameObject msg
rock2 =
    { identifier = "Rock2"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Rock_02.png"
    , size = { height = 32, width = 32 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


tree1 : GameObject msg
tree1 =
    { identifier = "Tree1"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Tree_01.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }


tree2 : GameObject msg
tree2 =
    { identifier = "Tree2"
    , position = None
    , collider = Svg.rect [] []
    , sprite = "assets/decor/Tree_02.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = { speed = 0, maxForwardSpeed = 0, maxBackwardSpeed = 0 }
    , physics =
        { forceForward = 0
        , forceBackward = 0
        }
    }
