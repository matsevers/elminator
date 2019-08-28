module Objects.Module exposing (motion, position, render, rotate)

import Objects.Render
import Objects.Update
import Objects.Utils


rotate =
    Objects.Utils.rotate


position =
    Objects.Utils.position


motion =
    Objects.Utils.motion


update =
    Objects.Update.update


render =
    { playground = Objects.Render.playground
    , player = Objects.Render.player
    , collider = Objects.Render.collider
    }
