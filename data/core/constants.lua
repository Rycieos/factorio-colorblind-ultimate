DefaultColors = {
  ["copper_wire-sprite"] = { r = 228, g = 139, b = 0, a = 255 },
  ["green_wire-sprite"] = { r = 97, g = 157, b = 61, a = 255 },
  ["red_wire-sprite"] = { r = 222, g = 59, b = 29, a = 255 },

  circuit_connector_red_light = { r = 255, g = 47, b = 0, a = 255 },
  circuit_connector_green_light = { r = 0, g = 255, b = 50, a = 255 },
  circuit_connector_blue_light = { r = 0, g = 255, b = 255, a = 255 },

  -- Copied directly from data/core/prototypes/utility-constants.lua.
  artillery_range = { r = 0.12, g = 0.0375, b = 0.0375, a = 0.15 },
  artillery_range_map = { r = 0.8, g = 0.25, b = 0.25, a = 1 },
  capsule_range = { r = 0.05, g = 0.1, b = 0.05, a = 0.15 },
  enemy = { r = 1, g = 0.1, b = 0.1, a = 1 },
  enemy_territory = { r = 0.3, g = 0.03, b = 0.03, a = 0.3 },
  turret_range = { r = 0.05, g = 0.1, b = 0.05, a = 0.15 },
  turret_range_map = { r = 0.8, g = 0.25, b = 0.25, a = 1 },

  -- From core/graphics/visualization-construction-radius.png
  construction_radius_visualization = { r = 131, g = 217, b = 55, a = 255 },
  -- From core/graphics/visualization-logistic-radius.png
  logistic_radius_visualization = { r = 255, g = 136, b = 0, a = 255 },
}

-- From core/graphics/gui.png
OldButtonBackgrounds = {
  blue = { 221, 72 },
  dark_blue = { 221, 36 },
  green = { 111, 108 },
  grey = { 111, 0 },
  orange = { 75, 108 },
  red = { 111, 36 },
  yellow = { 111, 72 },
}

-- From core/graphics/gui-new.png
NewSlotBackgrounds = {
  dark_blue = {
    default = { 330, 48 },
    selected = { 364, 48 },
    highlighted = { 274, 71 },
    level_band = { 347, 48 },
    level_range = { 330, 48 },
  },
  dark_red = {
    default = { 136, 17 },
    selected = { 187, 17 },
    highlighted = { 240, 71 },
    level_band = { 170, 17 },
    level_range = { 136, 17 },
  },
  dark_green = {
    default = { 432, 48 },
    selected = { 466, 48 },
    highlighted = { 257, 71 },
    level_band = { 449, 48 },
    level_range = { 432, 48 },
  },
  light_orange = {
    default = { 296, 136 },
    selected = { 312, 136 },
    highlighted = { 330, 136 },
    level_band = { 381, 136 },
    level_range = { 397, 136 },
  },
  orange = {
    default = { 296, 153 },
    selected = { 312, 153 },
    highlighted = { 330, 153 },
    level_band = { 381, 153 },
    level_range = { 397, 153 },
  },
  red = {
    default = { 296, 170 },
    selected = { 312, 170 },
    highlighted = { 330, 170 },
    level_band = { 381, 170 },
    level_range = { 397, 170 },
  },
  green = {
    default = { 296, 187 },
    selected = { 312, 187 },
    highlighted = { 330, 187 },
    level_band = { 381, 187 },
    level_range = { 397, 187 },
  },
  grey = {
    default = { 296, 204 },
    selected = { 312, 204 },
    highlighted = { 330, 204 },
    level_band = { 381, 204 },
    level_range = { 397, 204 },
  },
}
