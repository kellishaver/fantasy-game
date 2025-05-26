local monster_manager = {}

function monster_manager.draw_monster_at(tile, x, y)
  local monster = monsters[tile.monster]
  love.graphics.draw(monster.sprite, (x-1)*32, (y-1)*32)
end


function monster_manager.get_monsters_in_scene()
  local result = {}
  for _, monster in ipairs(monsters) do
    if monster.location == scenes[scene].label then
      table.insert(result, monster)
    end
  end
  if result ~= nil then
    print(#result)
  end
  return result
end

function monster_manager.move_monsters_toward_player(scene_monsters)
  for m = 1, #scene_monsters do
    monster_manager.move_monster_toward_player(scene_monsters[m])
  end
end

function monster_manager.move_monster_toward_player(monster)
  local dx = player.x - monster.x
  local dy = player.y - monster.y
  
  local new_x, new_y = monster.x, monster.y
  
  if math.abs(dx) > math.abs(dy) then
    new_x = monster.x + (dx > 0 and 1 or -1)
  else
    new_y = monster.y + (dy > 0 and 1 or -1)
  end
  
  if is_walkable(new_x, new_y) then
    monster.x, monster.y = new_x, new_y
  end
end

return monster_manager