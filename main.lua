font     = love.graphics.newFont("assets/upheavtt.ttf", 20)

sfx      = require("lib/tables/sfx")
items    = require("lib/tables/items")
monsters = require("lib/tables/monsters")
scenes   = require("lib/tables/scenes")
player   = require("lib/tables/player")
log      = require("lib/game-log")

tab_manager       = require("lib/tab-manager")
player_manager    = require("lib/player-manager")
scene_manager     = require("lib/scene-manager")
inventory_manager = require("lib/inventory-manager")
monster_manager   = require("lib/monster-manager")
sfx_manager       = require("lib/sfx-manager")
combat_manager    = require("lib/combat-manager")

function love.load()
  love.window.setTitle("Look at me, I'm a game!")
  love.window.setMode(1024, 768)
  love.graphics.setFont(love.graphics.newFont(16))

  background = love.graphics.newImage('assets/main-bg.png')

  scene = scenes[1]
  log.add_message("Welcome to the unnamed fantasy world! Use arrow keys to move.")
end

function love.keypressed(key)
  if (key == "up" or key == "down" or key == "left" or key == "right") then
    local moved = player_manager.move_player(key)
    if moved then
      scene_manager.handle_tile_interaction(player.x, player.y)
      monster_manager.move_adjacent_monsters()
    end
  elseif (key == "1" or key == "2" or key == "3" or key == "4") then
    combat_manager.perform_attack_action(key)
  end
end

function love.wheelmoved(x, y)
  log.scroll_offset = math.max(0, 
    math.min(#log.messages - log.max_visible, 
             log.scroll_offset - y))
end

function love.mousepressed(x, y, button)
   if button == 1 then
      tab_manager.click_tab(x, y)
   end
end

function love.update(dt)
  local src = nil

  if player.in_combat then
    src = sfx_manager.combat_music.source
  else
    src = sfx_manager.scene_music.source
  end

  if sfx_manager.scene_music or sfx_manager.combat_music then
    if not src:isPlaying() then
      love.audio.play(src)
    end
  end
end

function love.draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", (scene.width)*32, (scene.height)*32, 1024, 768)

  scene_manager.draw_scene()
  sfx_manager.play_scene_music()

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(background, 0, 0)

  player_manager.draw_player()
  player_manager.draw_player_stats()
  tab_manager.draw_tab_interface()
  log.draw_log()

  if tab_manager.active_tab == "combat" then
    tab_manager.show_combat_tab()
  elseif tab_manager.active_tab == "inv." then
    tab_manager.show_inventory_tab()
  elseif tab_manager.active_tab == "quests" then
    tab_manager.show_quests_tab()
  elseif tab_manager.active_tab == "char." then
    tab_manager.show_character_tab()
  end  

end
