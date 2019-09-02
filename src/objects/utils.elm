module Objects.Utils exposing
    ( motion
    , position
    , rotate
    )

import Objects.Physics
import Types


rotate : Float -> Types.GameObject -> Types.GameObject
rotate r gO =
    { gO | rotate = r }


position : Maybe Types.Position -> Types.GameObject -> Types.GameObject
position p gO =
    { gO | position = p }


motion : Maybe Types.Motion -> Types.GameObject -> Types.GameObject
motion m gO =
    { gO | motion = m }
