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
    order = localised_category,
    localised_name = localised_name or {"item-name." .. name},
    localised_description = "a custom overlay",
  }})
end

local function add_option_setting(name, localised_category, options)
  localised_category = localised_category or "item-name"
  data:extend({{
    name = config_name(name),
    type = "string-setting",
    setting_type = "startup",
    default_value = Options.none,
    allowed_values = {Options.none, table.unpack(options)},
    order = localised_category,
    localised_name = {localised_category .. "." .. name},
    localised_description = "a custom icon or overlay",
  }})
end

local function add_entity_setting(name)
  add_option_setting(name, "entity-name", {
    Options.icon_overlay_icon,
    Options.icon_overlay_entity,
    Options.icon_overlay,
  })
end

local function add_tiered_entity_setting(name)
  add_option_setting(name, "entity-name", {
    Options.tier_icon,
    Options.tier_entity,
    Options.tier,
  })
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

add_replace_setting("copper-cable")
add_replace_setting("copper-plate")
add_replace_setting("signal-each", {"", {"virtual-signal-name.signal-each"}, " signal"})
add_replace_setting("signal-everything", {"", {"virtual-signal-name.signal-everything"}, " signal"})
add_replace_setting("signal-colors", "All color signals")

add_option_setting("advanced-circuit", "item-name", {
  Options.icon,
  Options.tier_icon,
})
add_option_setting("electronic-circuit", "item-name", {
  Options.icon,
  Options.tier_icon,
})

add_overlay_setting("atomic-bomb")
add_overlay_setting("automation-science-pack")
add_overlay_setting("blueprint")
add_overlay_setting("chemical-science-pack")
add_overlay_setting("cliff-explosives")
add_overlay_setting("cluster-grenade")
add_overlay_setting("copper-ore")
add_overlay_setting("deconstruction-planner")
add_overlay_setting("effectivity-module")
add_overlay_setting("explosive-cannon-shell")
add_overlay_setting("explosive-rocket")
add_overlay_setting("explosive-uranium-cannon-shell")
add_overlay_setting("iron-ore")
add_overlay_setting("logistic-science-pack")
add_overlay_setting("military-science-pack")
add_overlay_setting("nuclear-fuel")
add_overlay_setting("piercing-rounds-magazine")
add_overlay_setting("piercing-shotgun-shell")
add_overlay_setting("processing-unit")
add_overlay_setting("production-science-pack")
add_overlay_setting("productivity-module")
add_overlay_setting("red-wire")
add_overlay_setting("slowdown-capsule")
add_overlay_setting("space-science-pack")
add_overlay_setting("speed-module")
add_overlay_setting("stone")
add_overlay_setting("upgrade-planner")
add_overlay_setting("uranium-235")
add_overlay_setting("uranium-cannon-shell")
add_overlay_setting("uranium-fuel-cell")
add_overlay_setting("uranium-ore")
add_overlay_setting("uranium-rounds-magazine")
add_overlay_setting("utility-science-pack")

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

add_entity_setting("burner-inserter")
add_entity_setting("fast-inserter")
add_entity_setting("filter-inserter")
add_entity_setting("logistic-chest-active-provider")
add_entity_setting("logistic-chest-buffer")
add_entity_setting("logistic-chest-passive-provider")
add_entity_setting("logistic-chest-requester")
add_entity_setting("logistic-chest-storage")
add_entity_setting("long-handed-inserter")
add_entity_setting("stack-filter-inserter")
add_entity_setting("stack-inserter")

add_tiered_entity_setting("assembling-machine-1")
add_tiered_entity_setting("assembling-machine-2")
add_tiered_entity_setting("assembling-machine-3")
add_tiered_entity_setting("express-loader")
add_tiered_entity_setting("express-splitter")
add_tiered_entity_setting("express-underground-belt")
add_tiered_entity_setting("fast-loader")
add_tiered_entity_setting("fast-splitter")
add_tiered_entity_setting("fast-transport-belt")
add_tiered_entity_setting("loader")
add_tiered_entity_setting("splitter")

add_option_setting("transport-belt", "entity-name", {
  Options.icon,
  Options.tier_icon,
  Options.tier_entity,
  Options.tier,
})
add_option_setting("express-transport-belt", "entity-name", {
  Options.icon,
  Options.tier_icon,
  Options.tier_entity,
  Options.tier,
})
add_option_setting("fast-underground-belt", "entity-name", {
  Options.icon,
  Options.entity,
  Options.icon_and_entity,
  Options.tier_icon,
  Options.tier_entity,
  Options.tier,
})
add_option_setting("underground-belt", "entity-name", {
  Options.icon,
  Options.entity,
  Options.icon_and_entity,
  Options.tier_icon,
  Options.tier_entity,
  Options.tier,
})

add_option_setting("green-wire", "item-name", {
  Options.icon,
  Options.text_overlay,
})

add_overlay_setting("crude-oil", {"fluid-name.crude-oil"})
add_overlay_setting("lubricant", {"fluid-name.lubricant"})
add_overlay_setting("petroleum-gas", {"fluid-name.petroleum-gas"})
add_overlay_setting("sulfuric-acid", {"fluid-name.sulfuric-acid"})

add_option_setting("heavy-oil", "fluid-name", {
  Options.icon,
  Options.text_overlay,
})
add_option_setting("light-oil", "fluid-name", {
  Options.icon,
  Options.text_overlay,
})
add_option_setting("water", "fluid-name", {
  Options.icon,
  Options.icon_overlay,
  Options.text_overlay,
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
    order = "a",
    localised_name = "Icon scale",
    localised_description = "scaling for icons overlaid the base icon",
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
