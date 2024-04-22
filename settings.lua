require("scripts/utils")

local function add_replace_setting(name)
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "b",
    localised_name = {"item-name." .. name},
    localised_description = "a custom icon",
  }})
end

local function add_overlay_setting(name, localised_category)
  localised_category = localised_category or "item-name"
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = localised_category,
    localised_name = {localised_category .. "." .. name},
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

add_replace_setting("advanced-circuit")
add_replace_setting("copper-cable")
add_replace_setting("copper-plate")
add_replace_setting("electronic-circuit")

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
add_overlay_setting("production-science-pack")
add_overlay_setting("productivity-module")
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
add_tiered_entity_setting("fast-underground-belt")
add_tiered_entity_setting("loader")
add_tiered_entity_setting("splitter")
add_tiered_entity_setting("underground-belt")

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

add_overlay_setting("crude-oil", "fluid-name")
add_overlay_setting("lubricant", "fluid-name")
add_overlay_setting("petroleum-gas", "fluid-name")
add_overlay_setting("sulfuric-acid", "fluid-name")

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

data:extend({{
  name = config_name("scale"),
  type = "double-setting",
  setting_type = "startup",
  default_value = 0.5,
  minimum_value = 0.1,
  maximum_value = 1.0,
  order = "a",
  localised_name = "Icon scale",
  localised_description = "scaling for icons overlaid the base icon",
}})
