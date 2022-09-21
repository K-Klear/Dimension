embedded_components {
  id: "sprite"
  type: "sprite"
  data: "tile_set: \"/props/props.atlas\"\n"
  "default_animation: \"noise_large\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 1.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "light"
  type: "sprite"
  data: "tile_set: \"/light/light.atlas\"\n"
  "default_animation: \"screen_large\"\n"
  "material: \"/render/light.material\"\n"
  "blend_mode: BLEND_MODE_ADD\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 1.1
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
