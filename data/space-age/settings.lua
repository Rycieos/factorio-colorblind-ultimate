require("data.space-age.constants")

local prototypes = require("data.space-age.prototypes")
settings_from_prototypes(prototypes)

-- Source: __space-age__/prototypes/spores.lua
add_map_color_setting("spores", "pollution", { r = 140, g = 140, b = 0, a = 149 }, { "airborne-pollutant-name.spores" })

-- Source: __space-age__/prototypes/entity/resources.lua
add_map_color_setting("calcite", "resource", { r = 0.99, g = 1.0, b = 0.92, a = 1.000 })
add_map_color_setting("fluorine-vent", "resource", { r = 0.0, g = 0.8, b = 1.0 })
add_map_color_setting("lithium-brine", "resource", { r = 0.7, g = 1.0, b = 0.6 })
add_map_color_setting("scrap", "resource", { r = 0.9, g = 0.9, b = 0.9 })
add_map_color_setting("sulfuric-acid-geyser", "resource", { r = 0.78, g = 0.78, b = 0.1 })
add_map_color_setting("tungsten-ore", "resource", { r = 98 / 256, g = 86 / 256, b = 150 / 256, a = 1.000 })

add_color_setting(
  "asteroid-collector-visualization",
  "radius-visualization",
  SpaceAgeDefaultColors["asteroid-collector-visualization"],
  {
    "",
    { "entity-name.asteroid-collector" },
    " ",
    { "description.range" },
    " ",
    { "gui-interface-settings.visualization" },
  }
)

add_color_setting("yumako-fruit", "plant", SpaceAgeDefaultColors["yumako-fruit"], {
  "",
  { "entity-name.yumako-tree" },
})

data:extend({
  {
    name = config_name("agricultural-tower-visual-green"),
    type = "bool-setting",
    setting_type = "runtime-per-user",
    default_value = false,
    order = order_prefix .. "b[agricultural]b",
    localised_name = {
      "",
      { "entity-name.agricultural-tower" },
      " ",
      { "color.green" },
      " ",
      { "gui-interface-settings.visualization" },
    },
    localised_description = { "colorblind_ultimate-description.agricultural-tower-visual" },
  },
  {
    name = config_name("agricultural-tower-visual-red"),
    type = "bool-setting",
    setting_type = "runtime-per-user",
    default_value = false,
    order = order_prefix .. "b[agricultural]b",
    localised_name = {
      "",
      { "entity-name.agricultural-tower" },
      " ",
      { "color.red" },
      " ",
      { "gui-interface-settings.visualization" },
    },
    localised_description = { "colorblind_ultimate-description.agricultural-tower-visual" },
  },
  {
    name = config_name("agricultural-tower-visual-yellow"),
    type = "bool-setting",
    setting_type = "runtime-per-user",
    default_value = false,
    order = order_prefix .. "b[agricultural]b",
    localised_name = {
      "",
      { "entity-name.agricultural-tower" },
      " ",
      { "color.yellow" },
      " ",
      { "gui-interface-settings.visualization" },
    },
    localised_description = { "colorblind_ultimate-description.agricultural-tower-visual" },
  },
  {
    name = config_name("agricultural-tower-visual-alt"),
    type = "bool-setting",
    setting_type = "runtime-per-user",
    default_value = false,
    order = order_prefix .. "b[agricultural]c",
    localised_name = {
      "",
      { "entity-name.agricultural-tower" },
      " ",
      { "gui-interface-settings.visualization" },
      " ",
      { "gui-interface-settings.alt-mode" },
      " ",
      { "deconstruction-tile-mode.only" },
    },
  },
})
