local monsters = {
  [1] = {
    id = 1,
    name = " Green Blob",
    description = "\"Blurble, gorp, glurp, glurp!\"\n\nA slimey green blob slurps at you aggressively. It looks... hungry?",
    location = "scene_two",
    sprite = love.graphics.newImage('assets/sprites/green-blob.png'),
    hp = 4,
    max_hp = 4,
    melee = 3,
    magic = 0,
    defense = 0,
    item = 2,
    damage = 2,
    xp = 10
  }
}

return monsters