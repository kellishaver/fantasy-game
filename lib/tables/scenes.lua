local scenes = {

  [1] = {
    id = 1,
    name = "Scene One",
    label = "scene_one",
    width = 16,
    height = 12,
    sprites = {
      floor = "assets/tiles/grass.png",
      door  = "assets/tiles/grass.png",
      wall  = "assets/tiles/tree-1.png"
    },
    tiles = {
      {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="door", id=1}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}}
    },
    doors = {
      [1] = {
        scene = 2,
        x = 1,
        y = 2
      }
    },
    message = "An open field. It looks safe here."
  },

  [2] = {
    id = 2,
    name = "Scene Two",
    label = "scene_two",
    width = 16,
    height = 12,
    sprites = {
      floor = "assets/tiles/grass.png",
      door  = "assets/tiles/grass.png",
      wall  = "assets/tiles/tree-1.png"
    },
    tiles = {
      {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}},
      {{type="door", id = 1}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="floor", item=1}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor", monster=1}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
      {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
      {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}}
    },
    doors = {
      [1] = {
        scene = 1,
        x = 16,
        y = 10
      }
    },
    message = "You're nearing the edge of a large forest."
  }
}
return scenes