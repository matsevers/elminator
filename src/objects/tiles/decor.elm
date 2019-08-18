module Objects.Tiles.Decor exposing (bush1, bush2, finishLine, platformBlue, rock1, rock2, startLine, tree1, tree2)

import Objects.Physics exposing (..)
import Objects.Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


startLine : GameObject
startLine =
    { identifier = "StartLine"
    , position = Nothing
    , collider = Nothing
    , sprite = ""
    , size = { height = 20, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


finishLine : GameObject
finishLine =
    { identifier = "FinishLine"
    , position = Nothing
    , collider =
        Nothing
    , sprite = "assets/decor/Finish.png"
    , size = { height = 64, width = 20 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


platformBlue : GameObject
platformBlue =
    { identifier = "PlatformBlue"
    , position = Nothing
    , collider = Nothing
    , sprite = "assets/decor/Pavilion_01.png"
    , size = { height = 64, width = 128 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


bush1 : GameObject
bush1 =
    { identifier = "Bush1"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "Bush1"
                            , duration = 100
                            , function = Objects.Physics.bump
                            }
                        )
                }
            )
    , sprite = "assets/decor/Bush_01.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


bush2 : GameObject
bush2 =
    { identifier = "Bush2"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "Bush2"
                            , duration = 100
                            , function = Objects.Physics.bump
                            }
                        )
                }
            )
    , sprite = "assets/decor/Bush_02.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


rock1 : GameObject
rock1 =
    { identifier = "Rock1"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 20
                , width = 32
                , position = { x = 0, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "Rock1"
                            , duration = 100
                            , function = Objects.Physics.bump
                            }
                        )
                }
            )
    , sprite = "assets/decor/Rock_01.png"
    , size = { height = 32, width = 32 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


rock2 : GameObject
rock2 =
    { identifier = "Rock2"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 20
                , width = 32
                , position = { x = 0, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "Rock2"
                            , duration = 100
                            , function = Objects.Physics.bump
                            }
                        )
                }
            )
    , sprite = "assets/decor/Rock_02.png"
    , size = { height = 32, width = 32 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


tree1 : GameObject
tree1 =
    { identifier = "Tree1"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 54
                , width = 54
                , position = { x = 5, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "Tree1"
                            , duration = 100
                            , function = Objects.Physics.bump
                            }
                        )
                }
            )
    , sprite = "assets/decor/Tree_01.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }


tree2 : GameObject
tree2 =
    { identifier = "Tree2"
    , position = Nothing
    , collider =
        Just
            (Rect
                { height = 54
                , width = 54
                , position = { x = 5, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { trigger = "Tree2"
                            , duration = 100
                            , function = Objects.Physics.bump
                            }
                        )
                }
            )
    , sprite = "assets/decor/Tree_02.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Nothing
    , physics = Nothing
    }
