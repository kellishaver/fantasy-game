local scene_manager = {}

function scene_manager.draw_scene()
  love.graphics.setColor(1, 1, 1, 1)  -- Reset to white
  for y = 1, scene.height do
    for x = 1, scene.width do
      local tile = scene.tiles[y][x]
      sprite = love.graphics.newImage(scene.sprites[tile.type])
      love.graphics.draw(sprite, (x-1)*32, (y-1)*32)

      if tile.item then
        inventory_manager.draw_item_at(tile, x, y)
      end

      if tile.monster then
        monster_manager.draw_monster_at(tile, x, y)
      end
    end
  end
end

function scene_manager.is_walkable(x, y)
  if x < 1 or x > scene.width or y < 1 or y > scene.height then
    return false
  end
  
  local tile = scene.tiles[y][x]
  return (tile.type == "floor" or tile.type == "door") and tile.monster == nil
end

-- Square has an event.
function scene_manager.handle_tile_interaction(x, y)
  local tile = scene.tiles[y][x]

  if tile.type == "door" and tile.id then
    scene_manager.try_door(tile.id)
  elseif tile.item then
    inventory_manager.collect_item(tile)
  end
end

-- Respond to door states
function scene_manager.try_door(id)
  door = scene.doors[id]
  scene = scenes[door.scene]
  log.add_message(scene.message)
  player.x = door.x
  player.y = door.y
end

return scene_manager