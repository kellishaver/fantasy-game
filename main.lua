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

  background = love.graphics.newImage('assets/main-bg.png')

  scene = scenes[1]
  log.add_message("Welcome to the unnamed fantasy world! Use arrow keys to move.")
end

function love.keypressed(key)
  if (key == "up" or key == "down" or key == "left" or key == "right") and
    combat_manager.in_combat == true then
      return
  end

  local moved = false

  local new_x, new_y = player.x, player.y
  if key == "up" then
    new_y = new_y - 1
    player.facing = "up"
    moved = true
  elseif key == "down" then
    new_y = new_y + 1
    player.facing = "down"
    moved = true
  elseif key == "left" then
    new_x = new_x - 1
    player.facing = "left"
    moved = true
  elseif key == "right" then
    new_x = new_x + 1
    player.facing = "right"
    moved = true
  end

  if moved and scene_manager.is_walkable(new_x, new_y) then
    player.x = new_x
    player.y = new_y

    scene_manager.handle_tile_interaction(new_x, new_y)

    scene_monsters = monster_manager.get_monsters_in_scene(new_x, new_y)
    if #scene_monsters > 0 then
      if monster_manager.check_adjacent(new_x, new_y) then
        combat_manager.initiate_combat(monster)
      else
        monster_manager.move_monsters_toward_player(scene_monsters)
      end
    end
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
