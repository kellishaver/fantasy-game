local sfx = {
  [1] = {
    id = 1,
    label = "overworld_loop",
    source = love.audio.newSource("assets/sfx/overworld-loop.mp3", "static")
  },
  [2] = {
    id = 2,
    label = "combat_loop",
    source = love.audio.newSource("assets/sfx/combat-loop.mp3", "static")
  }
}

return sfx