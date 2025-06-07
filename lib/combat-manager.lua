local combat_manager = {
  monster = nil,
  turn = "player",
  overlay = nil,
  monster_attack_timer = 0,
  monster_attack_delay = 1.0,
  flash_timer = 0,
  flash_duration = 0.3
}

function combat_manager.initiate_combat(current_monster)
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
  if not player.in_combat then
    return
  end

  min_y = 100
  min_x = 554

  local monster = combat_manager.monster
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("- "..monster.name, font, 640, 66)
  love.graphics.printf(monster.description, 700, 120, 300, "left")
  love.graphics.draw(monster.sprite, min_x, min_y, 0, 4, 4)

  if combat_manager.turn == "player" then
    combat_manager.render_player_actions_menu()
  else
    combat_manager.render_monster_action()
  end
end

function combat_manager.render_player_actions_menu()
  love.graphics.print("It's your turn!", font, 554, 240)
  
  local actions = combat_manager.get_combat_actions()
  
  for i, action in ipairs(actions) do
    local y_pos = 260 + (i * 20)
    
    if action.enabled then
      love.graphics.setColor(1, 1, 1, 1)
    else
      love.graphics.setColor(1, 1, 1, 0.5)
    end
    
    love.graphics.print(i, font, 564, y_pos)
    love.graphics.print("- " .. action.text, font, 584, y_pos)
  end
  
  love.graphics.setColor(1, 1, 1, 1)
end

function combat_manager.get_combat_actions()
  local weapon_text = player.equipment.weapon and player.equipment.weapon.name or "unarmed"
  
  return {
    {text = "Attack : " .. weapon_text, enabled = true},
    {text = "Defend", enabled = true},
    {text = "Use Item", enabled = #inventory_manager.get_inventory() > 0},
    {text = "Flee", enabled = true}
  }
end

function combat_manager.render_monster_action()
  love.graphics.print("It's "..combat_manager.monster.name.."'s turn...", font, 554, 240)
end

function combat_manager.perform_attack_action(key)
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

function combat_manager.melee_attack(attacker, target)
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

function combat_manager.get_melee_damage(target)
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

function combat_manager.apply_damage(target, attacker, attack_role)
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

function combat_manager.do_monster_attack()
  combat_manager.monster_attack_timer = combat_manager.monster_attack_delay
end

function combat_manager.end_combat()
  player.in_combat = false
  combat_manager.turn = "player"
  tab_manager.active_tab = "inv."
  sfx_manager.stop_combat_music()

  x, y = monster_manager.find_monster_position(combat_manager.monster.id)

  scene.tiles[y][x].monster = nil
end

function combat_manager.render_flash_overlay()
  if combat_manager.flash_timer > 0 then
    -- Calculate alpha based on remaining time (fade out effect)
    local alpha = combat_manager.flash_timer / combat_manager.flash_duration
    love.graphics.setColor(1, 0, 0, alpha * 0.3)  -- Red with fading transparency
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)  -- Reset color
  end
end

function combat_manager.update(dt)
  if not player.in_combat then
    return
  end

  if combat_manager.monster_attack_timer > 0 then
    combat_manager.monster_attack_timer = combat_manager.monster_attack_timer - dt
    if combat_manager.monster_attack_timer <= 0 then
      combat_manager.melee_attack(combat_manager.monster, player)
    end
  end

  if combat_manager.flash_timer > 0 then
    combat_manager.flash_timer = combat_manager.flash_timer - dt
  end
end

return combat_manager