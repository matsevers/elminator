module Objects.Module exposing (motion, position, render, rotate)

import Objects.Physics
import Objects.Render
import Objects.Trigger
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


physics =
    { update = Objects.Physics.update
    , checkCollision = Objects.Physics.checkCollision
    }


trigger =
    { run = Objects.Trigger.run
    , startCheckpoint = Objects.Trigger.startCheckpoint
    , endCheckpoint = Objects.Trigger.endCheckpoint
    , catchCheckpoint = Objects.Trigger.catchCheckpoint
    }
