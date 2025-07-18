local combat_core = {}

function combat_core.initiate_combat(current_monster)
  if player.in_combat then
    return
  end

  combat_manager.monster = current_monster
  player.in_combat = true   -- Set the right flag
  sfx_manager.play_combat_music()
  tab_manager.active_tab = "combat"
  combat_manager.set_combat_facing()
  log.add_message("It's a "..current_monster.name.."... time to fight!")
end

function combat_core.do_monster_attack()
  combat_manager.monster_attack_timer = combat_manager.monster_attack_delay
end

function combat_core.end_combat()
  player.in_combat = false
  combat_manager.turn = "player"
  tab_manager.active_tab = "inv."
  sfx_manager.stop_combat_music()
  combat_core.resolution()
end

function combat_core.resolution()
  if player.hp > 0 and combat_manager.monster.hp == 0 then
    combat_core.player_win()
  elseif player.hp == 0 then
    combat_core.monster_win()
  end
end

function combat_core.player_win()
  x, y = monster_manager.find_monster_position(combat_manager.monster.id)
  scene.tiles[y][x].monster = nil
  sfx_manager.success()
  monster_manager.drop_loot(combat_manager.monster, x, y)
end

function combat_core.monster_win()
  sfx_manager.player_death()
end

return combat_core