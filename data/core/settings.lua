require("data.core.constants")

local function add_color_setting(name, localised_name, localised_description)
  data:extend({{
    name = config_name(name .. "-color"),
    type = "string-setting",
    setting_type = "startup",
    allow_blank = true,
    default_value = "",
    order = "q",
    localised_name = localised_name,
    localised_description = localised_description,
  }})
end

local function add_bg_color_setting(name, default, localised_name)
  data:extend({{
    name = config_name(name .. "-background-color"),
    type = "string-setting",
    setting_type = "startup",
    default_value = default,
    allowed_values = keys(NewSlotBackgrounds),
    order = "z",
    localised_name = localised_name .. " background color",
  }})
end

add_bg_color_setting("available-technology", "light_orange", "Available technology")
add_bg_color_setting("conditionally-available-technology", "orange", "Conditionally available technology")
add_bg_color_setting("unavailable-technology", "red", "Unavailable technology")
add_bg_color_setting("researched-technology", "green", "Researched technology")
add_bg_color_setting("disabled-technology", "grey", "Disabled technology")

add_color_setting("artillery_range",
  {"technology-name.artillery-shell-range"},
  {"", "custom color for ", {"technology-name.artillery-shell-range"}, " on the map. Hex color format. Default is cc4040ff."}
)
add_color_setting("capsule_range",
  {"", {"ammo-category-name.capsule"}, " range"},
  "custom color for capsules/grenades range visualization in game. Hex color format. Default is 0d190d26."
)
add_color_setting("enemy",
  {"autoplace-control-names.enemy-base"},
  {"", "custom color for ", {"autoplace-control-names.enemy-base"}, " on the map. Hex color format. Default is ff1919."}
)
add_color_setting("pollution",
  {"item-name.pollution"},
  {"", "custom color for ", {"item-name.pollution"}, " on the map. Hex color format. Default is 8c000095."}
)
add_color_setting("turret_range",
  "Turret range",
  "custom color for turret range visualization in game. Hex color format. Default is 0d190d26."
)
add_color_setting("turret_range_map",
  "Turret range on map",
  "custom color for turret range on the map. Hex color format. Default is cc4040ff."
)

add_color_setting("copper_wire-sprite",
  {"", {"item-name.copper-cable"}, " sprite"},
  {"", "custom color for ", {"item-name.copper-cable"}, " between poles. Hex color format. Default is e48b00."}
)
add_color_setting("green_wire-sprite",
  {"", {"item-name.green-wire"}, " sprite"},
  {"", "custom color for ", {"item-name.green-wire"}, " between poles. Hex color format. Default is 619d3d."}
)
add_color_setting("red_wire-sprite",
  {"", {"item-name.red-wire"}, " sprite"},
  {"", "custom color for ", {"item-name.red-wire"}, " between poles. Hex color format. Default is de3b1d."}
)

data:extend({
  {
    name = config_name("green-circuit-background-color"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "green",
    allowed_values = keys(OldButtonBackgrounds),
    order = "r",
    localised_name = "Green circuit background color",
  },
  {
    name = config_name("red-circuit-background-color"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "red",
    allowed_values = keys(OldButtonBackgrounds),
    order = "r",
    localised_name = "Red circuit background color",
  },
})
