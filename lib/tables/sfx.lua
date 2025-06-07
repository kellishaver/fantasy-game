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
}

return sfx