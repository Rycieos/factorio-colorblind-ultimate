require("data.space-age.constants")

local prototypes = require("data.space-age.prototypes")
settings_from_prototypes(prototypes)

-- Source: __space-age__/prototypes/spores.lua
add_map_color_setting("spores", { r = 140, g = 140, b = 0, a = 149 }, { "airborne-pollutant-name.spores" })

-- Source: __space-age__/prototypes/entity/resources.lua
add_map_color_setting("calcite", { r = 0.99, g = 1.0, b = 0.92, a = 1.000 })
add_map_color_setting("fluorine-vent", { r = 0.0, g = 0.8, b = 1.0 })
add_map_color_setting("lithium-brine", { r = 0.7, g = 1.0, b = 0.6 })
add_map_color_setting("scrap", { r = 0.9, g = 0.9, b = 0.9 })
add_map_color_setting("sulfuric-acid-geyser", { r = 0.78, g = 0.78, b = 0.1 })
add_map_color_setting("tungsten-ore", { r = 98 / 256, g = 86 / 256, b = 150 / 256, a = 1.000 })

add_color_setting("asteroid-collector-visualization", SpaceAgeDefaultColors["asteroid-collector-visualization"], {
  "",
  { "entity-name.asteroid-collector" },
  " ",
  { "description.range" },
  " ",
  { "gui-interface-settings.visualization" },
})
