local player = {
  x = 8,
  y = 2,
  stamina = 3,
  melee = 4,
  magic = 1,
  defense = 3,
  hp = 15,
  hp_max = 15,
  xp = 0,
  equipment = {
    weapon = nil,
    shield = nil,
    helm = nil,
    armor = nil,
    boots = nil,
    ring = nil
  },
  spells = {},
  sprites = {
    up    = love.graphics.newImage('assets/sprites/hero-up.png'),
    left  = love.graphics.newImage('assets/sprites/hero-left.png'),
    right = love.graphics.newImage('assets/sprites/hero-right.png'),
    down  = love.graphics.newImage('assets/sprites/hero-down.png')
  },
  facing = "down",
  in_combat = false,
}

return player