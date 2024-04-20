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
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "c",
    localised_name = {(localised_category or "item-name") .. "." .. name},
    localised_description = "a custom overlay",
  }})
end

local function add_fluid_setting(name, options)
  data:extend({{
    name = config_name(name),
    type = options and "string-setting" or "bool-setting",
    setting_type = "startup",
    default_value = options and options[1] or false,
    allowed_values = options,
    order = "f",
    localised_name = {"fluid-name." .. name},
    localised_description = options and "a custom icon or overlay" or "a custom overlay",
  }})
end

add_replace_setting("advanced-circuit")
add_replace_setting("copper-cable")
add_replace_setting("copper-plate")
add_replace_setting("electronic-circuit")

add_overlay_setting("atomic-bomb")
add_overlay_setting("automation-science-pack")
add_overlay_setting("blueprint")
add_overlay_setting("burner-inserter", "entity-name")
add_overlay_setting("chemical-science-pack")
add_overlay_setting("cliff-explosives")
add_overlay_setting("cluster-grenade")
add_overlay_setting("copper-ore")
add_overlay_setting("deconstruction-planner")
add_overlay_setting("effectivity-module")
add_overlay_setting("explosive-cannon-shell")
add_overlay_setting("explosive-rocket")
add_overlay_setting("explosive-uranium-cannon-shell")
add_overlay_setting("fast-inserter", "entity-name")
add_overlay_setting("filter-inserter", "entity-name")
add_overlay_setting("iron-ore")
add_overlay_setting("logistic-chest-active-provider", "entity-name")
add_overlay_setting("logistic-chest-buffer", "entity-name")
add_overlay_setting("logistic-chest-passive-provider", "entity-name")
add_overlay_setting("logistic-chest-requester", "entity-name")
add_overlay_setting("logistic-chest-storage", "entity-name")
add_overlay_setting("logistic-science-pack")
add_overlay_setting("long-handed-inserter", "entity-name")
add_overlay_setting("military-science-pack")
add_overlay_setting("nuclear-fuel")
add_overlay_setting("piercing-rounds-magazine")
add_overlay_setting("piercing-shotgun-shell")
add_overlay_setting("production-science-pack")
add_overlay_setting("productivity-module")
add_overlay_setting("slowdown-capsule")
add_overlay_setting("space-science-pack")
add_overlay_setting("speed-module")
add_overlay_setting("stack-filter-inserter", "entity-name")
add_overlay_setting("stack-inserter", "entity-name")
add_overlay_setting("stone")
add_overlay_setting("upgrade-planner")
add_overlay_setting("uranium-235")
add_overlay_setting("uranium-cannon-shell")
add_overlay_setting("uranium-fuel-cell")
add_overlay_setting("uranium-ore")
add_overlay_setting("uranium-rounds-magazine")
add_overlay_setting("utility-science-pack")

add_fluid_setting("crude-oil")
add_fluid_setting("lubricant")
add_fluid_setting("petroleum-gas")
add_fluid_setting("sulfuric-acid")

local allowed_values = {"none", "text-overlay", "icon"}
add_fluid_setting("heavy-oil", allowed_values)
add_fluid_setting("light-oil", allowed_values)
add_fluid_setting("water", {"none", "text-overlay", "icon", "icon-overlay"})

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
