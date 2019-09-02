module Map.Generator exposing (fill, map, possibleTileCoords)

import Objects.Tiles.Background
import Svg
import Svg.Attributes
import Types


map : Types.Map -> List Types.GameObject
map m =
    m.gameObjects.background
        ++ m.gameObjects.roads
        ++ m.gameObjects.decor
        ++ m.gameObjects.trigger


fill : Types.GameObject -> List Types.Position -> List Types.GameObject
fill f l =
    case l of
        x :: xs ->
            { f | position = Just x } :: fill f xs

        [] ->
            []


possibleTileCoords : Types.Map -> List Types.Position
possibleTileCoords m =
    let
        createRows : Int -> Int -> List Types.Position
        createRows yp xp =
            if xp < (m.dimension.width * m.dimension.tileSize) then
                { x = xp, y = yp } :: createRows yp (xp + m.dimension.tileSize)

            else if yp < (m.dimension.height * m.dimension.tileSize) then
                { x = 0, y = yp + m.dimension.tileSize } :: createRows (yp + m.dimension.tileSize) (0 + m.dimension.tileSize)

            else
                []
    in
    createRows 0 0
