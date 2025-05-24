local game_log = {
  messages = {},
  max_visible = 6,
  scroll_offset = 0
}

function game_log.add_message(text)
  table.insert(game_log.messages, text)
  game_log.scroll_offset = math.max(0, #game_log.messages - game_log.max_visible)
end

function game_log.draw_log()
  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle("fill", 10,590, 1004,150, 8,8)

  local start_line = game_log.scroll_offset + 1
  local end_line = math.min(#game_log.messages, start_line + game_log.max_visible - 1)

  local line_height = 20

  love.graphics.setColor(1, 1, 1)

  for i = start_line, end_line do
    local y_pos = log_y + (i - start_line) * line_height
    love.graphics.print(game_log.messages[i], log_x, y_pos)
  end
end

return game_log