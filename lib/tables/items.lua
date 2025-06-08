local items = {
  [1] = {
    id = 1,
    name = "Copper Key",
    description = "It's a simple key with no markings.",
    location = "scene_two",
    sprite = love.graphics.newImage('assets/items/copper-key.png'),
    equippable = false,
    single_use = true,
    meta = {
      type = "key"
    }
  },
  [2] = {
    id = 2,
    name = "Soggy Sandwich",
    description = "It's uncomfortably wet, but somewhat nourishing.",
    location = nil,
    sprite = love.graphics.newImage('assets/items/sandwich.png'),
    equippable = false,
    single_use = true,
    meta = {
      type = "healing",
      value = 1
    }
  }
}

return items