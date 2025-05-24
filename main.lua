font     = love.graphics.newFont("assets/upheavtt.ttf", 20)
scenes   = require("lib/scenes")
player   = require("lib/player")
utils    = require("lib/utils")
render   = require ("lib/render")
game_log = require ("lib/game-log")
log_x    = 30
log_y    = 600
debug    = true

function love.load()
  love.window.setTitle("Look at me, I'm a game!")
  love.window.setMode(1024, 768)

  background = love.graphics.newImage('assets/main-bg.png')

  scene = scenes["scene_one"]

  game_log.add_message("Welcome to the unnamed fantasy world!")
end

function love.keypressed(key)
  local new_x, new_y = player.x, player.y
  if key == "up" then
    new_y = new_y - 1
  elseif key == "down" then
    new_y = new_y + 1
  elseif key == "left" then
    new_x = new_x - 1
  elseif key == "right" then
    new_x = new_x + 1
  end

  if utils.is_walkable(new_x, new_y) then
    player.x = new_x
    player.y = new_y
    utils.handle_tile_interaction(new_x, new_y)
  end

  if debug then
    game_log.add_message("Debug: pressed key:" .. key)
  end
end

function love.wheelmoved(x, y)
  game_log.scroll_offset = math.max(0, 
    math.min(#game_log.messages - game_log.max_visible, 
             game_log.scroll_offset - y))
end

function love.update(dt)
end

function love.draw()
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.rectangle("fill", (scene.width)*32, (scene.height)*32, 1024, 768)

  render.draw_scene()

  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", (player.x-1)*32, (player.y-1)*32, 32, 32)

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(background, 0, 0)

  render.draw_player_stats()
  game_log.draw_log()
end
