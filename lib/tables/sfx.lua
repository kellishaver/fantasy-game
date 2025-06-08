local sfx = {
  [1] = {
    id = 1,
    label = "overworld_loop",
    source = love.audio.newSource("assets/sfx/overworld-loop.wav", "static")
  },
  [2] = {
    id = 2,
    label = "combat_loop",
    source = love.audio.newSource("assets/sfx/combat-loop.wav", "static")
  },
  [3] = {
    id = 3,
    label = "punch",
    source = love.audio.newSource("assets/sfx/punch.mp3", "static")
  },
  [4] = {
    id = 4,
    label = "grunt",
    source = love.audio.newSource("assets/sfx/grunt.mp3", "static")
  },
  [5] = {
    id = 5,
    label = "success",
    source = love.audio.newSource("assets/sfx/success.mp3", "static")
  },
  [6] = {
    id = 6,
    label = "player_death",
    source = love.audio.newSource("assets/sfx/player-death.mp3", "static")
  },
  [7] = {
    id = 76,
    label = "pick_up",
    source = love.audio.newSource("assets/sfx/pick-up.mp3", "static")
  },
}

return sfx