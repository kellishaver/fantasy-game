local combat_damage = {}

function combat_damage.get_melee_damage(target)
  local damage = 0

  if combat_manager.turn == "player" then
    if player.equipment.weapon == nil then
      damage = 1
    else
      damage = player.equipment.weapon.damage
    end
  else
    damage = combat_manager.monster.damage
  end
  
  return math.max(1, damage - target.defense)
end

function combat_damage.apply_damage(target, attacker, attack_role)
  local total_damage = combat_manager.get_melee_damage(target)

  target.hp = math.max(0, target.hp - total_damage)

  if combat_manager.turn == "player" then
    log.add_message("You hit "..target.name.." for "..total_damage.." damage!")
    sfx_manager.punch()
  else
    log.add_message(attacker.name.." hit you for for "..total_damage.." damage!")
    sfx_manager.grunt()
    combat_manager.flash_timer = combat_manager.flash_duration
  end
end

return combat_damage