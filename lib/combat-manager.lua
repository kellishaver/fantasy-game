local combat_core     = require("lib/combat/combat-core")
local combat_actions  = require("lib/combat/combat-actions")
local combat_ui       = require("lib/combat/combat-ui")
local combat_damage   = require("lib/combat/combat-damage")

local combat_manager = {
  monster = nil,
  turn = "player",
  overlay = nil,
  monster_attack_timer = 0,
  monster_attack_delay = 1.0,
  flash_timer = 0,
  flash_duration = 0.3
}

combat_manager.initiate_combat            = combat_core.initiate_combat
combat_manager.do_monster_attack          = combat_core.do_monster_attack
combat_manager.end_combat                 = combat_core.end_combat

combat_manager.melee_attack               = combat_actions.melee_attack

combat_manager.get_melee_damage           = combat_damage.get_melee_damage
combat_manager.apply_damage               = combat_damage.apply_damage

combat_manager.set_combat_facing          = combat_ui.set_combat_facing
combat_manager.render_combat              = combat_ui.render_combat  
combat_manager.render_player_actions_menu = combat_ui.render_player_actions_menu
combat_manager.get_combat_actions         = combat_ui.get_combat_actions
combat_manager.render_monster_action      = combat_ui.render_monster_action
combat_manager.render_flash_overlay       = combat_ui.render_flash_overlay
combat_manager.update                     = combat_ui.update

return combat_manager