local combat_actions = {}

function combat_actions.perform_attack_action(key)
  if not player.in_combat then
    return
  end

  if key == "1" and combat_manager.turn == "player" then
    combat_manager.melee_attack(player,  combat_manager.monster)
  elseif key == "2" then
  elseif key == "3" then
  elseif key == "4" then
  end
end

function combat_actions.melee_attack(attacker, target)
  local to_hit_percent = 30 + (attacker.melee*5)

  math.randomseed(os.time())
  local attack_role = math.random(1, 100)

  if attack_role <= to_hit_percent then
    combat_manager.apply_damage(target, attacker, attack_role)
  else
    if combat_manager.turn == "player" then
      log.add_message("You missed!")
    else
      log.add_message(attacker.name.." missed you!")
    end
  end

  if target.hp == 0 then
    combat_manager.end_combat(target)
    return
  end

  if combat_manager.turn == "player" then
    combat_manager.turn = "monster"
    combat_manager.do_monster_attack()
  else
    combat_manager.turn = "player"
  end
end

return combat_actions