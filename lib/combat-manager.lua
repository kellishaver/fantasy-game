local combat_manager = {
  monster = nil
}

function combat_manager.initiate_combat(current_monster)
  if player.in_combat then
    return
  end

  combat_manager.monster = current_monster
  combat_manager.in_combat = true   -- Set the right flag
  sfx_manager.play_combat_music()
  tab_manager.active_tab = "combat"
  log.add_message("It's a "..current_monster.name.."... time to fight!")
end

function combat_manager.render_combat()

  min_y = 110
  min_x = 554

  love.graphics.draw(combat_manager.monster.sprite, (x-1)*32, (y-1)*32)
end

return combat_manager