require("scripts/utils")

local function add_replace_setting(name, localised_name)
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "b",
    localised_name = localised_name or {"item-name." .. name},
    localised_description = "a custom icon",
  }})
end

local function add_overlay_setting(name, localised_name)
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "c",
    localised_name = localised_name or {"item-name." .. name},
    localised_description = "a custom overlay",
  }})
end

local function add_option_setting(name, localised_name, options)
  data:extend({{
    name = config_name(name),
    type = "string-setting",
    setting_type = "startup",
    default_value = Options.none,
    allowed_values = {Options.none, table.unpack(options)},
    order = "d",
    localised_name = localised_name,
    localised_description = "a custom icon, overlay, or text overlay",
  }})
end

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

local prototypes = require("data.base.prototypes")
for name, proto in pairs(prototypes) do
  local allowed_values = {}
  local is_entity = proto.is_entity or proto.sprite_replacement
  if proto.icon_replacement then
    table.insert(allowed_values, Options.icon)
    if proto.sprite_replacement then
      table.insert(allowed_values, Options.icon_and_entity)
    end
  end
  if proto.sprite_replacement then
    table.insert(allowed_values, Options.entity)
  end
  if proto.icon_overlay or proto.icon_overlay_from then
    if proto.icon_overlay and string.sub(proto.icon_overlay, 1, 4) == "tier-" then
      table.insert(allowed_values, Options.tier)
      if is_entity then
        table.insert(allowed_values, Options.tier_icon)
        table.insert(allowed_values, Options.tier_entity)
      end
    else
      table.insert(allowed_values, Options.icon_overlay)
      if is_entity then
        table.insert(allowed_values, Options.icon_overlay_icon)
        table.insert(allowed_values, Options.icon_overlay_entity)
      end
    end
  end
  if proto.text_overlay then
    table.insert(allowed_values, Options.text_overlay)
    if is_entity then
      table.insert(allowed_values, Options.text_overlay_icon)
      table.insert(allowed_values, Options.text_overlay_entity)
    end
  end

  add_option_setting(name,
    proto.localised_name or {((is_entity and "entity" or "item") .. "-name." .. name)},
    allowed_values
  )
end

add_replace_setting("signal-colors", "All color signals")

add_overlay_setting("rail-chain-signal-blue", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-blue"},
})
add_overlay_setting("rail-chain-signal-green", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-green"},
})
add_overlay_setting("rail-chain-signal-red", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-red"},
})
add_overlay_setting("rail-chain-signal-yellow", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-yellow"},
})

add_overlay_setting("train-stop-signal-red", {
  "",
  {"entity-name.train-stop"},
  " ",
  {"virtual-signal-name.signal-red"},
})


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
add_color_setting("artillery_range",
  {"technology-name.artillery-shell-range"},
  {"", "custom color for ", {"technology-name.artillery-shell-range"}, " on the map. Hex color format. Default is cc4040ff."}
)
add_color_setting("enemy",
  {"autoplace-control-names.enemy-base"},
  {"", "custom color for ", {"autoplace-control-names.enemy-base"}, " on the map. Hex color format. Default is ff1919."}
)
add_color_setting("pollution",
  {"item-name.pollution"},
  {"", "custom color for ", {"item-name.pollution"}, " on the map. Hex color format. Default is 8c000095."}
)
add_color_setting("capsule_range",
  {"", {"ammo-category-name.capsule"}, " range"},
  "custom color for capsules/grenades range visualization in game. Hex color format. Default is 0d190d26."
)
add_color_setting("turret_range",
  "Turret range",
  "custom color for turret range visualization in game. Hex color format. Default is 0d190d26."
)
add_color_setting("turret_range_map",
  "Turret range on map",
  "custom color for turret range on the map. Hex color format. Default is cc4040ff."
)

add_bg_color_setting("available-technology", "light_orange", "Available technology")
add_bg_color_setting("conditionally-available-technology", "orange", "Conditionally available technology")
add_bg_color_setting("unavailable-technology", "red", "Unavailable technology")
add_bg_color_setting("researched-technology", "green", "Researched technology")
add_bg_color_setting("disabled-technology", "grey", "Disabled technology")

data:extend({
  {
    name = config_name("scale"),
    type = "double-setting",
    setting_type = "startup",
    default_value = 0.5,
    minimum_value = 0.1,
    maximum_value = 1.0,
    order = "aa",
    localised_name = "Icon scale",
    localised_description = "scaling for icons overlaid the base icon",
  },
  {
    name = config_name("overlay-corner"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "lower-left",
    allowed_values = keys(Offsets),
    order = "ab",
    localised_name = "Overlay location",
  },
  {
    name = config_name("secondary-overlay-corner"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "upper-left",
    allowed_values = keys(Offsets),
    order = "ab",
    localised_name = "Secondary overlay location",
    localised_description = "for icons that need more than one overlay",
  },
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
