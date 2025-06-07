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
  min_y = 110
  min_x = 554

  love.graphics.draw(combat_manager.monster.sprite, (x-1)*32, (y-1)*32)
end

return combat_manager