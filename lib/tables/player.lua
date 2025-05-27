local player = {
  x = 8,
  y = 2,
  stamina = 3,
  melee = 4,
  ranged = 2,
  magic = 1,
  defense = 3,
  hp = 15,
  hp_max = 15,
  equipment = {
    weapon = nil,
    shield = nil,
    helm = nil,
    armor = nil,
    boots = nil,
    cape = nil,
    necklace = nil
  },
  sprites = {
    up    = love.graphics.newImage('assets/sprites/hero-up.png'),
    left  = love.graphics.newImage('assets/sprites/hero-left.png'),
    right = love.graphics.newImage('assets/sprites/hero-right.png'),
    down  = love.graphics.newImage('assets/sprites/hero-down.png')
  },
  facing = "down"
}

return player