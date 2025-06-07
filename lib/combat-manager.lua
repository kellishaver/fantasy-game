local combat_manager = {
  monster = nil
}

function combat_manager.initiate_combat(current_monster)
  if player.in_combat then
    return
  end

  combat_manager.monster = current_monster
  player.in_combat = true   -- Set the right flag
  sfx_manager.play_combat_music()
  tab_manager.active_tab = "combat"
  log.add_message("It's a "..current_monster.name.."... time to fight!")

  combat_manager.set_combat_facing()
end

function combat_manager.set_combat_facing()
  local monster_x, monster_y = monster_manager.find_monster_position(combat_manager.monster.id)

  if player.x-1 == monster_x then
    player.facing = "left"
  elseif player.x+1 == monster_x then
    player.facing = "right"
  elseif player.y-1 == monster_y then
    player.facing = "up"
  else
    player.facing = "down"
  end
end

function combat_manager.render_combat()
  min_y = 100
  min_x = 554

  local monster = combat_manager.monster
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("- "..monster.name, font, 640, 66)
  love.graphics.printf(monster.description, 680, 120, 300, "left")
  love.graphics.draw(monster.sprite, min_x, min_y, 0, 4, 4)

  love.graphics.print("It's your turn!", font, 554, 240)

  love.graphics.print("1", font, 564, 280)
  love.graphics.print("- Attack", font, 584, 280)

  love.graphics.print("2", font, 564, 300)
  love.graphics.print("- Defend", font, 584, 300)

  love.graphics.print("3", font, 564, 320)
  love.graphics.print("- Flee", font, 584, 320)

end

return combat_manager