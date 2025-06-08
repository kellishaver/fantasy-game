local monster_manager = {}

function monster_manager.draw_monster_at(tile, x, y)
  local monster = monsters[tile.monster]
  love.graphics.draw(monster.sprite, (x-1)*32, (y-1)*32)
end

function monster_manager.get_monsters_in_scene(tile_x, tile_y)
  local result = {}
  for _, monster in ipairs(monsters) do
    if monster.location == scene.label then
      table.insert(result, monster)
    end
  end
  return result
end

function monster_manager.find_monster_position(monster_id)
  for y = 1, scene.height do
    for x = 1, scene.width do
      if scene.tiles[y][x].monster == monster_id then
        return x, y
      end
    end
  end
  return nil, nil
end

function monster_manager.move_adjacent_monsters()
  local adjacent_monster = player_manager.adjacent_to_monster()
  if adjacent_monster then
    combat_manager.initiate_combat(adjacent_monster)
  else
    local scene_monsters = monster_manager.get_monsters_in_scene()
    if #scene_monsters > 0 then
      monster_manager.move_monsters_toward_player(scene_monsters)
    end
  end
end

function monster_manager.move_monsters_toward_player(scene_monsters)
  for m = 1, #scene_monsters do
    monster_manager.move_monster_toward_player(scene_monsters[m])
  end
end

function monster_manager.move_monster_toward_player(monster)
  local curr_x, curr_y = monster_manager.find_monster_position(monster.id)
  
  if not curr_x or not curr_y then
    return
  end
  
  local dx = player.x - curr_x
  local dy = player.y - curr_y
  
  local new_x, new_y = curr_x, curr_y
  
  if math.abs(dx) > math.abs(dy) then
    new_x = curr_x + (dx > 0 and 1 or -1)
  else
    new_y = curr_y + (dy > 0 and 1 or -1)
  end
  
  if scene_manager.is_walkable(new_x, new_y) then
    scene.tiles[curr_y][curr_x].monster = nil
    scene.tiles[new_y][new_x].monster = monster.id
  end

  if player_manager.adjacent_to_monster() then
    combat_manager.initiate_combat(monster)
  end
end

function monster_manager.drop_loot(monster, x, y)
  if monster.item then
    scene.tiles[y][x].item = monster.item
  end
end

return monster_manager