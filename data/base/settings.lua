local prototypes = require("data.base.prototypes")
settings_from_prototypes(prototypes)

add_bool_setting(
  "signal-colors",
  { "", { "gui.all" }, " ", { "gui.color" }, " ", { "item-group-name.signals" } },
  { "colorblind_ultimate-description.custom-icon" }
)

add_option_setting(
  "filled-barrels",
  { "", { "gui.all" }, " ", { "item-name.filled-barrel", { "factoriopedia.fluid" } } },
  {
    "fluid-icon",
    "fluid-overlay",
  }
)

add_bool_setting(
  "rail-chain-signal-blue",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-blue" } }
)
add_bool_setting(
  "rail-chain-signal-green",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-green" } }
)
add_bool_setting(
  "rail-chain-signal-red",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-red" } }
)
add_bool_setting(
  "rail-chain-signal-yellow",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-yellow" } }
)

add_bool_setting(
  "train-stop-signal-red",
  { "", { "entity-name.train-stop" }, " ", { "virtual-signal-name.signal-red" } }
)

-- Source: __base__/prototypes/pollution.lua
add_map_color_setting("pollution", { r = 140, g = 0, b = 0, a = 149 }, { "airborne-pollutant-name.pollution" })

-- Source: __base__/prototypes/entity/resources.lua
add_map_color_setting("coal", { r = 0, g = 0, b = 0 })
add_map_color_setting("copper-ore", { r = 0.803, g = 0.388, b = 0.215 })
add_map_color_setting("crude-oil", { r = 0.78, g = 0.2, b = 0.77 })
add_map_color_setting("iron-ore", { r = 0.415, g = 0.525, b = 0.580 })
add_map_color_setting("stone", { r = 0.690, g = 0.611, b = 0.427 })
add_map_color_setting("uranium-ore", { r = 0, g = 0.7, b = 0 })
