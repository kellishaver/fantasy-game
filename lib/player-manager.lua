local player_manager = {}

function player_manager.draw_player_stats()

  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle("fill", 10,430, 512,140, 8,8)

  love.graphics.setColor(1, 1, 1)

  love.graphics.print("Stamina", font, 30, 450)
  love.graphics.print(player.stamina, font, 140, 450)

  love.graphics.print("Melee", font, 30, 470)
  love.graphics.print(player.melee, font, 140, 470)

  love.graphics.print("Ranged", font, 30, 490)
  love.graphics.print(player.ranged, font, 140, 490)

  love.graphics.print("Magic", font, 30, 510)
  love.graphics.print(player.magic, font, 140, 510)

  love.graphics.print("Defense", font, 30, 530)
  love.graphics.print(player.magic, font, 140, 530)

  love.graphics.print("HP", font, 240, 470, 0, 2.5,2.5)
  love.graphics.print(player.hp .. "/" .. player.hp_max, font, 320,470, 0, 2.5,2.5)
end

function player_manager.draw_player()
  love.graphics.draw(player.sprites[player.facing], (player.x-1)*32, (player.y-1)*32)
end
return player_manager