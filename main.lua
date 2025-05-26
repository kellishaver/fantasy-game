font     = love.graphics.newFont("assets/upheavtt.ttf", 20)

items    = require("lib/tables/items")
scenes   = require("lib/tables/scenes")
player   = require("lib/tables/player")
log      = require ("lib/game-log")

tab_manager       = require("lib/tab-manager")
player_manager    = require("lib/player-manager")
scene_manager     = require("lib/scene-manager")
inventory_manager = require("lib/inventory-manager")

function love.load()
  love.window.setTitle("Look at me, I'm a game!")
  love.window.setMode(1024, 768)

  background = love.graphics.newImage('assets/main-bg.png')

  scene = scenes["scene_one"]
  log.add_message("Welcome to the unnamed fantasy world! Use arrow keys to move.")
end

function love.keypressed(key)
  local new_x, new_y = player.x, player.y
  if key == "up" then
    new_y = new_y - 1
    player.facing = "up"
  elseif key == "down" then
    new_y = new_y + 1
    player.facing = "down"
  elseif key == "left" then
    new_x = new_x - 1
    player.facing = "left"
  elseif key == "right" then
    new_x = new_x + 1
    player.facing = "right"
  end

  if scene_manager.is_walkable(new_x, new_y) then
    player.x = new_x
    player.y = new_y
    scene_manager.handle_tile_interaction(new_x, new_y)
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

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(background, 0, 0)

  player_manager.draw_player()
  player_manager.draw_player_stats()
  tab_manager.draw_tab_interface()
  log.draw_log()

  if tab_manager.active_tab == "game" then
    tab_manager.show_game_tab()
  elseif tab_manager.active_tab == "inv." then
    tab_manager.show_inventory_tab()
  elseif tab_manager.active_tab == "quests" then
    tab_manager.show_quests_tab()
  elseif tab_manager.active_tab == "char." then
    tab_manager.show_character_tab()
  end  

end
