require("data.core.constants")

-- Create a setting from a default color based on the input name.
---@param name string
---@param order string
---@param localised_name data.LocalisedString
local function add_core_color_setting(name, order, localised_name)
  add_color_setting(name, order, DefaultColors[name], localised_name)
end

-- Create a setting for background colors from the new_gui sprite sheet.
---@param name string
---@param order string
---@param default string
---@param localised_name data.LocalisedString
---@param allowed_values? string[]
local function add_bg_color_setting(name, order, default, localised_name, allowed_values)
  data:extend({
    {
      name = config_name(name .. "-background-color"),
      type = "string-setting",
      setting_type = "startup",
      default_value = default,
      allowed_values = allowed_values or keys(NewSlotBackgrounds),
      order = order_prefix .. "z[" .. order .. "]",
      localised_name = localised_name,
    },
  })
end

add_bg_color_setting("available-technology", "technology", "light_orange", {
  "",
  { "gui-technology-preview.status-available" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("conditionally-available-technology", "technology", "orange", {
  "",
  { "colorblind_ultimate-word.status-conditionally-available" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("unavailable-technology", "technology", "red", {
  "",
  { "gui-technology-preview.status-not-available" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("researched-technology", "technology", "green", {
  "",
  { "gui-technology-preview.status-researched" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("disabled-technology", "technology", "grey", {
  "",
  { "gui-technology-preview.status-disabled" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})

add_core_color_setting(
  "artillery_range",
  "turret-range",
  { "", { "technology-name.artillery-shell-range" }, " ", { "colorblind_ultimate-word.in-game" } }
)
add_core_color_setting(
  "artillery_range_map",
  "turret-range",
  { "", { "technology-name.artillery-shell-range" }, " ", { "colorblind_ultimate-word.on-map" } }
)
add_core_color_setting(
  "capsule_range",
  "turret-range",
  { "", { "ammo-category-name.capsule" }, " ", { "description.range" } }
)
add_core_color_setting("enemy", "faction", { "autoplace-control-names.enemy-base" })
add_core_color_setting(
  "enemy_territory",
  "faction",
  { "", { "gui-map-generator.enemy-expansion-group-tile" }, " ", { "description.range" } }
)
add_core_color_setting(
  "turret_range",
  "turret-range",
  { "", { "tooltip-category.turret" }, " ", { "description.range" }, " ", { "colorblind_ultimate-word.in-game" } }
)
add_core_color_setting(
  "turret_range_map",
  "turret-range",
  { "", { "tooltip-category.turret" }, " ", { "description.range" }, " ", { "colorblind_ultimate-word.on-map" } }
)

add_core_color_setting(
  "ghost_shader_ghost_tint",
  "ghost",
  { "", { "entity-status.ghost" }, " ", { "gui-deconstruction.entities" } }
)
add_core_color_setting("ghost_shader_ghost_delivery_tint", "ghost", {
  "",
  { "entity-status.ghost" },
  " ",
  { "gui-deconstruction.entities" },
  " ",
  { "description.item-request-proxy-deliver" },
})
add_core_color_setting(
  "ghost_shader_tile_ghost_tint",
  "ghost",
  { "", { "entity-status.ghost" }, " ", { "gui-deconstruction.tiles" } }
)
add_core_color_setting("ghost_shader_tile_ghost_delivery_tint", "ghost", {
  "",
  { "entity-status.ghost" },
  " ",
  { "gui-deconstruction.tiles" },
  " ",
  { "description.item-request-proxy-deliver" },
})
add_core_color_setting(
  "ghost_shader_wire_tint",
  "ghost",
  { "", { "entity-status.ghost" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)

add_core_color_setting("construction_radius_visualization", "raidus-visualization", {
  "",
  { "entity-name.roboport" },
  " ",
  { "entity-name.construction-robot" },
  " ",
  { "description.range" },
  " ",
  { "gui-interface-settings.visualization" },
})
add_core_color_setting("logistic_radius_visualization", "raidus-visualization", {
  "",
  { "entity-name.roboport" },
  " ",
  { "entity-name.logistic-robot" },
  " ",
  { "description.range" },
  " ",
  { "gui-interface-settings.visualization" },
})

add_core_color_setting(
  "copper_wire-sprite",
  "wire",
  { "", { "item-name.copper-cable" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)
add_core_color_setting(
  "green_wire-sprite",
  "wire",
  { "", { "item-name.green-wire" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)
add_core_color_setting(
  "red_wire-sprite",
  "wire",
  { "", { "item-name.red-wire" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)

add_core_color_setting(
  "circuit_connector_red_light",
  "circuit",
  { "", { "gui-control-behavior.circuit-connection" }, " ", { "virtual-signal-name.signal-red" } }
)
add_core_color_setting(
  "circuit_connector_green_light",
  "circuit",
  { "", { "gui-control-behavior.circuit-connection" }, " ", { "virtual-signal-name.signal-green" } }
)
add_core_color_setting(
  "circuit_connector_blue_light",
  "circuit",
  { "", { "gui-control-behavior.circuit-connection" }, " ", { "virtual-signal-name.signal-blue" } }
)

add_core_color_setting("green-circuit-background", "circuit", {
  "",
  { "item-name.green-wire" },
  " ",
  { "gui-control-behavior.circuit-network" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_core_color_setting("red-circuit-background", "circuit", {
  "",
  { "item-name.red-wire" },
  " ",
  { "gui-control-behavior.circuit-network" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})

add_core_color_setting("blue_slot_background", "gui", {
  "",
  { "color.blue" },
  " ",
  { "gui-blueprint-library.slots-view" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_core_color_setting("green_slot_background", "gui", {
  "",
  { "color.green" },
  " ",
  { "gui-blueprint-library.slots-view" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_core_color_setting("red_slot_background", "gui", {
  "",
  { "color.red" },
  " ",
  { "gui-blueprint-library.slots-view" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_core_color_setting("yellow_slot_background", "gui", {
  "",
  { "color.yellow" },
  " ",
  { "gui-blueprint-library.slots-view" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
