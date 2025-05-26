local game_log = {
  messages = {},
  max_visible = 6,
  scroll_offset = 0,
  line_height = 25,
  x = 30,
  y = 600
}

function game_log.add_message(text)
  table.insert(game_log.messages, text)
  game_log.scroll_offset = math.max(0, #game_log.messages - game_log.max_visible)
end

function game_log.draw_log()
  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle("fill", 10,580, 1004,180, 8,8)

  local start_line = game_log.scroll_offset + 1
  local end_line = math.min(#game_log.messages, start_line + game_log.max_visible - 1)

  love.graphics.setColor(1, 1, 1)

  for i = start_line, end_line do
    local y_pos = game_log.y + (i - start_line) * game_log.line_height
    love.graphics.print(game_log.messages[i], game_log.x, y_pos)
  end
end

return game_log