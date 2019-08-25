module Objects.Tiles.Decor exposing (bush1, bush2, platformBlue, rock1, rock2, tree1, tree2)

import Objects.Physics exposing (..)
import Types exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


platformBlue : GameObject
platformBlue =
    { identifier = "PlatformBlue"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider = Maybe.Nothing
    , sprite = "assets/decor/Pavilion_01.png"
    , size = { height = 64, width = 128 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


bush1 : GameObject
bush1 =
    { identifier = "Bush1"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "Bush1"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Just Objects.Physics.bump                            
                            , unmodifiedObject = Maybe.Nothing                            
                            }
                        )
                , triggerFunction = Maybe.Nothing        
                }
            )
    , sprite = "assets/decor/Bush_01.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


bush2 : GameObject
bush2 =
    { identifier = "Bush2"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 64
                , width = 64
                , position = { x = 0, y = 0 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "Bush2"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Just Objects.Physics.bump                            
                            , unmodifiedObject = Maybe.Nothing                            
                            }
                        )
                , triggerFunction = Maybe.Nothing        
                }
            )
    , sprite = "assets/decor/Bush_02.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


rock1 : GameObject
rock1 =
    { identifier = "Rock1"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 20
                , width = 32
                , position = { x = 0, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "Rock1"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Just Objects.Physics.bump
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing
                }
            )
    , sprite = "assets/decor/Rock_01.png"
    , size = { height = 32, width = 32 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


rock2 : GameObject
rock2 =
    { identifier = "Rock2"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 20
                , width = 32
                , position = { x = 0, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "Rock2"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Just Objects.Physics.bump
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing        
                }
            )
    , sprite = "assets/decor/Rock_02.png"
    , size = { height = 32, width = 32 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


tree1 : GameObject
tree1 =
    { identifier = "Tree1"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 54
                , width = 54
                , position = { x = 5, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "Tree1"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Just Objects.Physics.bump
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing        
                }
            )
    , sprite = "assets/decor/Tree_01.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }


tree2 : GameObject
tree2 =
    { identifier = "Tree2"
    , kind = Types.Decor
    , position = Maybe.Nothing
    , collider =
        Just
            (Rect
                { height = 54
                , width = 54
                , position = { x = 5, y = 5 }
                , impactFunction =
                    Just
                        (Impact
                            { identifier = "Tree2"
                            , duration = 100
                            , overrideBackgroundImpact = True
                            , function = Just Objects.Physics.bump
                            , unmodifiedObject = Maybe.Nothing
                            }
                        )
                , triggerFunction = Maybe.Nothing        
                }
            )
    , sprite = "assets/decor/Tree_02.png"
    , size = { height = 64, width = 64 }
    , rotate = 0
    , motion = Maybe.Nothing
    , physics = Maybe.Nothing
    }
