require("data.base.constants")

local prototypes = require("data.base.prototypes")
settings_from_prototypes(prototypes)

add_bool_setting("signal-colors", "virtual-signal", {
  "",
  { "gui.all" },
  " ",
  { "gui.color" },
  " ",
  { "item-group-name.signals" },
  ": ",
  { "colorblind_ultimate-description.icon-replacement" },
}, { "colorblind_ultimate-description.custom-icon" })

add_option_setting(
  "filled-barrels",
  "fluidz",
  { "", { "gui.all" }, " ", { "item-name.filled-barrel", { "factoriopedia.fluid" } } },
  {
    "fluid-icon",
    "fluid-overlay",
  }
)

add_bool_setting(
  "rail-chain-signal-blue",
  "rail-signal",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-blue" } }
)
add_bool_setting(
  "rail-chain-signal-green",
  "rail-signal",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-green" } }
)
add_bool_setting(
  "rail-chain-signal-red",
  "rail-signal",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-red" } }
)
add_bool_setting(
  "rail-chain-signal-yellow",
  "rail-signal",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-yellow" } }
)

add_bool_setting(
  "train-stop-signal-red",
  "rail-signal",
  { "", { "entity-name.train-stop" }, " ", { "virtual-signal-name.signal-red" } }
)

-- Source: __base__/prototypes/pollution.lua
add_map_color_setting(
  "pollution",
  "pollution",
  { r = 140, g = 0, b = 0, a = 149 },
  { "airborne-pollutant-name.pollution" }
)

-- Source: __base__/prototypes/entity/resources.lua
add_map_color_setting("coal", "resource", { r = 0, g = 0, b = 0 })
add_map_color_setting("copper-ore", "resource", { r = 0.803, g = 0.388, b = 0.215 })
add_map_color_setting("crude-oil", "resource", { r = 0.78, g = 0.2, b = 0.77 })
add_map_color_setting("iron-ore", "resource", { r = 0.415, g = 0.525, b = 0.580 })
add_map_color_setting("stone", "resource", { r = 0.690, g = 0.611, b = 0.427 })
add_map_color_setting("uranium-ore", "resource", { r = 0, g = 0.7, b = 0 })

add_color_setting(
  "beacon-visualization",
  "range-visualization",
  BaseDefaultColors["beacon-visualization"],
  { "", { "entity-name.beacon" }, " ", { "description.range" }, " ", { "gui-interface-settings.visualization" } }
)
add_color_setting(
  "electric-pole-visualization",
  "range-visualization",
  BaseDefaultColors["electric-pole-visualization"],
  {
    "",
    { "tips-and-tricks-item-name.electric-network" },
    " ",
    { "description.range" },
    " ",
    { "gui-interface-settings.visualization" },
  }
)
add_color_setting(
  "mining-drill-visualization",
  "range-visualization",
  BaseDefaultColors["mining-drill-visualization"],
  { "", { "description.mining-area" }, " ", { "description.range" }, " ", { "gui-interface-settings.visualization" } }
)
