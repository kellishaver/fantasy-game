local player_manager = {}

function player_manager.draw_player_stats()

  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle("fill", 10,430, 512,140, 8,8)

  love.graphics.setColor(1, 1, 1)

  love.graphics.print("Stamina", font, 30, 450)
  love.graphics.print(player.stamina, font, 140, 450)

  love.graphics.print("Melee", font, 30, 470)
  love.graphics.print(player.melee, font, 140, 470)

  love.graphics.print("Ranged", font, 30, 490)
  love.graphics.print(player.ranged, font, 140, 490)

  love.graphics.print("Magic", font, 30, 510)
  love.graphics.print(player.magic, font, 140, 510)

  love.graphics.print("Defense", font, 30, 530)
  love.graphics.print(player.magic, font, 140, 530)

  love.graphics.print("HP", font, 240, 470, 0, 2.5,2.5)
  love.graphics.print(player.hp .. "/" .. player.hp_max, font, 320,470, 0, 2.5,2.5)
end

function player_manager.draw_player()
  love.graphics.draw(player.sprites[player.facing], (player.x-1)*32, (player.y-1)*32)
end

function player_manager.adjacent_to_monster()
  if player.in_combat then
    return
  end

  local adjacent_monster = nil

  scene_monsters = monster_manager.get_monsters_in_scene()
  for _, monster in ipairs(scene_monsters) do
    local monster_x, monster_y = monster_manager.find_monster_position(monster.id)
    if monster_x and monster_y then
      if player_manager.is_adjacent_to(monster_x, monster_y) then
        adjacent_monster = monster
      end
    end

    if adjacent_monster then break end
  end

  return adjacent_monster
end

function player_manager.is_adjacent_to(x, y)
  return 
    (player.x == x-1 and player.y == y) or
    (player.x == x+1 and player.y == y) or
    (player.y == y-1 and player.x == x) or
    (player.y == y+1 and player.x == x)
end

function player_manager.move_player(key)
  if player.in_combat then
    return false
  end

  local moved = false

  local new_x, new_y = player.x, player.y
  if key == "up" then
    new_y = new_y - 1
  elseif key == "down" then
    new_y = new_y + 1
  elseif key == "left" then
    new_x = new_x - 1
  elseif key == "right" then
    new_x = new_x + 1
  end

  player.facing = key
  moved = true

  if moved and scene_manager.is_walkable(new_x, new_y) then
    player.x = new_x
    player.y = new_y
  end
  return moved
end

return player_manager