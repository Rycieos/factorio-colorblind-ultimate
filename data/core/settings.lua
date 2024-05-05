require("data.core.constants")

local function add_core_color_setting(name, localised_name)
  add_color_setting(name, localised_name, DefaultColors[name])
end

local function add_bg_color_setting(name, default, localised_name, allowed_values)
  data:extend({
    {
      name = config_name(name .. "-background-color"),
      type = "string-setting",
      setting_type = "startup",
      default_value = default,
      allowed_values = allowed_values or keys(NewSlotBackgrounds),
      order = order_prefix .. "z",
      localised_name = localised_name,
    },
  })
end

add_bg_color_setting("available-technology", "light_orange", {
  "",
  { "gui-technology-preview.status-available" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("conditionally-available-technology", "orange", {
  "",
  { "colorblind_ultimate-word.status-conditionally-available" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("unavailable-technology", "red", {
  "",
  { "gui-technology-preview.status-not-available" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("researched-technology", "green", {
  "",
  { "gui-technology-preview.status-researched" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})
add_bg_color_setting("disabled-technology", "grey", {
  "",
  { "gui-technology-preview.status-disabled" },
  " ",
  { "gui-map-generator.technology-difficulty-group-tile" },
  " ",
  { "colorblind_ultimate-word.background-color" },
})

add_core_color_setting("artillery_range", { "technology-name.artillery-shell-range" })
add_core_color_setting("capsule_range", { "", { "ammo-category-name.capsule" }, " ", { "description.range" } })
add_core_color_setting("enemy", { "autoplace-control-names.enemy-base" })
add_core_color_setting("pollution", { "item-name.pollution" })
add_core_color_setting(
  "turret_range",
  { "", { "tooltip-category.turret" }, " ", { "description.range" }, " ", { "colorblind_ultimate-word.in-game" } }
)
add_core_color_setting(
  "turret_range_map",
  { "", { "tooltip-category.turret" }, " ", { "description.range" }, " ", { "colorblind_ultimate-word.on-map" } }
)

add_core_color_setting(
  "construction_radius_visualization",
  { "", { "entity-name.roboport" }, " ", { "entity-name.construction-robot" }, " ", { "description.range" } }
)
add_core_color_setting(
  "logistic_radius_visualization",
  { "", { "entity-name.roboport" }, " ", { "entity-name.logistic-robot" }, " ", { "description.range" } }
)

add_core_color_setting(
  "copper_wire-sprite",
  { "", { "item-name.copper-cable" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)
add_core_color_setting(
  "green_wire-sprite",
  { "", { "item-name.green-wire" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)
add_core_color_setting(
  "red_wire-sprite",
  { "", { "item-name.red-wire" }, " ", { "tips-and-tricks-item-name.electric-pole-connections" } }
)

add_bg_color_setting("green-circuit", "green", {
  "",
  { "item-name.green-wire" },
  " ",
  { "gui-control-behavior.circuit-network" },
  " ",
  { "colorblind_ultimate-word.background-color" },
}, keys(OldButtonBackgrounds))
add_bg_color_setting("red-circuit", "red", {
  "",
  { "item-name.red-wire" },
  " ",
  { "gui-control-behavior.circuit-network" },
  " ",
  { "colorblind_ultimate-word.background-color" },
}, keys(OldButtonBackgrounds))
