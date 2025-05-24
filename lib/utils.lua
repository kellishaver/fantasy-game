local utils = {}

-- Can we walk in this square?
function utils.is_walkable(x, y)
  if x < 1 or x > scene.width or y < 1 or y > scene.height then
    return false
  end
  
  local tile = scene.tiles[y][x]
  return tile.type == "floor" or tile.type == "door"
end

-- Square has an event.
function utils.handle_tile_interaction(x, y)
  local tile = scene.tiles[y][x]

  if tile.type == "door" and tile.id then
    utils.try_door(tile.id)
  end
end

-- Respond to door states
function utils.try_door(id)
  door = scene.doors[id]
  scene = scenes[door.scene]
  player.x = door.x
  player.y = door.y
end

return utils