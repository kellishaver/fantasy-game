local combat_manager = {
  in_combat = false,
  monster = nil
}

function combat_manager.initiate_combat(current_monster)
  if combat_manager.monster then
    return
  end

  combat_manager.monster = current_monster
  combat_manager.in_combat = true
  tab_manager.active_tab = "combat"
  sfx_manager.play_combat_music()
  log.add_message("It's a "..current_monster.name.."... time to fight!")
end

return combat_manager