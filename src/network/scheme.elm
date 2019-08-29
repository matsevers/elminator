module Network.Scheme exposing (test)

import Json.Decode exposing (..)
import Json.Decode.Extra exposing (..)
import Json.Encode exposing (..)
import List exposing (..)
import Network.Decode
import Types exposing (..)


test =
    0



{- case message of
   Ok m ->
       let
           gameObject =
               { identifier = m.message.gOIdentifier
               , kind = Car
               , size = { height = m.message.gOSizeHeight, width = m.message.gOSizeWidth }
               , position = Just { x = m.message.gOPositionX, y = m.message.gOPositionY }
               , spriteMinimap = Just m.message.gOSprite
               , sprite = m.message.gOSprite
               , collider = Maybe.Nothing
               , rotate = m.message.gORotate
               , motion = Maybe.Nothing
               , physics = Maybe.Nothing
               }

           player =
               { identifier = m.message.identifier
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
               , currentLab = m.message.currentLab
               , time = m.message.time
               , controlledObject = gameObject
               , catchedCheckpoints = []
               , label = { text = m.message.label, color = m.message.labelCol, size = m.message.labelSize, visible = m.message.labelVisible }
               }
       in
       Just player


   _ ->
       Maybe.Nothing
-}
