local combat_ui = {}

function combat_ui.render_combat()
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
    combat_ui.render_player_actions_menu()
  else
    combat_ui.render_monster_action()
  end
end

function combat_ui.set_combat_facing()
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

function combat_ui.render_player_actions_menu()
  love.graphics.print("It's your turn!", font, 554, 240)
  
  local actions = combat_ui.get_combat_actions()
  
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

function combat_ui.get_combat_actions()
  local weapon_text = player.equipment.weapon and player.equipment.weapon.name or "unarmed"
  
  return {
    {text = "Attack : " .. weapon_text, enabled = true},
    {text = "Defend", enabled = true},
    {text = "Use Item", enabled = #inventory_manager.get_inventory() > 0},
    {text = "Flee", enabled = true}
  }
end

function combat_ui.render_monster_action()
  love.graphics.print("It's "..combat_manager.monster.name.."'s turn...", font, 554, 240)
end

function combat_ui.render_flash_overlay()
  if combat_manager.flash_timer > 0 then
    -- Calculate alpha based on remaining time (fade out effect)
    local alpha = combat_manager.flash_timer / combat_manager.flash_duration
    love.graphics.setColor(1, 0, 0, alpha * 0.3)  -- Red with fading transparency
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)  -- Reset color
  end
end

function combat_ui.update(dt)
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

return combat_ui