require("data.core.constants")

local function add_core_color_setting(name, order, localised_name)
  add_color_setting(name, order, DefaultColors[name], localised_name)
end

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

if mods["space-age"] then
  -- While this functionality is in core, the localization requires Space Age to be loaded.
  add_core_color_setting(
    "agricultural_range",
    "radius-visualization",
    { "", { "technology-name.agriculture" }, " ", { "description.range" } }
  )
end
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

add_bg_color_setting("green-circuit", "circuit", "green", {
  "",
  { "item-name.green-wire" },
  " ",
  { "gui-control-behavior.circuit-network" },
  " ",
  { "colorblind_ultimate-word.background-color" },
}, keys(OldButtonBackgrounds))
add_bg_color_setting("red-circuit", "circuit", "red", {
  "",
  { "item-name.red-wire" },
  " ",
  { "gui-control-behavior.circuit-network" },
  " ",
  { "colorblind_ultimate-word.background-color" },
}, keys(OldButtonBackgrounds))
