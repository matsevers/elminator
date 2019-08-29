module Network.Scheme exposing (player)

import Json.Decode exposing (..)
import Json.Decode.Extra exposing (..)
import Json.Encode exposing (..)
import List exposing (..)
import Network.Decode
import Types exposing (..)


player : SchemePlayer -> Player
player p =
    let
        gameObject =
            { identifier = p.gOIdentifier
            , kind = Car
            , size = { height = p.gOSizeHeight, width = p.gOSizeWidth }
            , position = Just { x = p.gOPositionX, y = p.gOPositionY }
            , spriteMinimap = Just p.gOSprite
            , sprite = p.gOSprite
            , collider = Maybe.Nothing
            , rotate = p.gORotate
            , motion = Maybe.Nothing
            , physics = Maybe.Nothing
            }

        playerRecord =
            { identifier = p.identifier
            , assignedKeys =
                { forward = Types.Other
                , backward = Types.Other
                , left = Types.Other
                , right = Types.Other
                , action = Types.Other
                }
            , storedKeys =
                { forward = Types.Nothing
                , backward = Types.Nothing
                , left = Types.Nothing
                , right = Types.Nothing
                }
            , currentLab = p.currentLab
            , time = p.time
            , controlledObject = gameObject
            , catchedCheckpoints = []
            , label = { text = p.label, color = p.labelCol, size = p.labelSize, visible = p.labelVisible }
            }
    in
    playerRecord
