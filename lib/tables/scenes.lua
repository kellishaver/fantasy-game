local scenes = {}

scenes.scene_one = {
  name = "Scene One",
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
    {
      scene = "scene_two",
      x = 1,
      y = 2
    }
  },
  message = "An open field. It looks safe here."
}

scenes.scene_two = {
  name = "Scene Two",
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
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}}
  },
  doors = {
    {
      scene = "scene_one",
      x = 16,
      y = 10
    }
  },
  message = "You're nearing the edge of a large forest."
}

return scenes