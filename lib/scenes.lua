local scenes = {}

scenes.scene_one = {
  name = "Scene One",
  width = 16,
  height = 12,
  tiles = {
    {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="door", id=1}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}}
  },
  doors = {
    {
      scene = "scene_two",
      x = 1,
      y = 2
    }
  }
}

scenes.scene_two = {
  name = "Scene Two",
  width = 16,
  height = 12,
  tiles = {
    {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}},
    {{type="door", id = 1}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}, {type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="floor"}, {type="wall"}},
    {{type="wall"}, {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"},  {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}, {type="wall"}}
  },
  doors = {
    {
      scene = "scene_one",
      x = 16,
      y = 10
    }
  }
}

return scenes