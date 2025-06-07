local monsters = {
  [1] = {
    id = 1,
    name = " Green Blob",
    description = "\"Blurble, gorp, glurp, glurp!\"\n\nA slimey green blog slurps at you aggressively. It looks... hungry?",
    location = "scene_two",
    sprite = love.graphics.newImage('assets/sprites/green-blob.png'),
    max_hp = 4,
    current_hp = 4,
    attack = 1,
    item = 2
  }
}

return monsters