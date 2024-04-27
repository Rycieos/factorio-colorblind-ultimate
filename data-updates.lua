require("scripts/config")
require("scripts/fluids")
require("scripts/icon_overlays")
require("scripts/icons")
require("scripts/sprites")

local function do_replace_icon(_type, name)
  if config(name) then
    replace_icon(data.raw[_type][name], CustomIcons[name])
    return true
  end
  return false
end

local function do_overlay_icon(_type, name, icon, icon2)
  icon = icon or Overlays[name]
  if config(name) then
    local obj = data.raw[_type][name]
    overlay_icon(obj, icon, icon2)
    if obj.pictures then
      overlay_sprite_variation(
        obj.pictures,
        icon_to_sprite(icon, 0.5),
        icon2 and icon_to_sprite(icon2, 0.5)
      )
    end
    return true
  end
  return false
end

local function do_replace_or_overlay_icon(_type, name, icon, icon2)
  local setting = config(name)
  if setting ~= Options.none then
    local obj = data.raw[_type][name]
    if setting == Options.icon then
      replace_icon(obj, CustomIcons[name])
    else
      overlay_icon(obj, icon, icon2)
    end
  end
end

local function do_overlay_entity_icon(_type, name, icon, icon2)
  local setting = config(name)
  if setting ~= Options.none then
    local obj = data.raw[_type][name]

    if setting == Options.icon or setting == Options.icon_and_entity then
      local icon = CustomIcons[name]
      replace_icon(obj, icon)
      replace_icon(get_item_from_entity(obj), icon)
    elseif setting ~= Options.entity
        and setting ~= Options.tier_entity
        and setting ~= Options.icon_overlay_entity
        then
      overlay_icon(obj, icon, icon2)
      overlay_icon(get_item_from_entity(obj), icon, icon2)
    end
    if setting == Options.entity
        or setting == Options.icon_and_entity
        then
      replace_sprite(obj)
    elseif setting == Options.tier
        or setting == Options.tier_entity
        or setting == Options.icon_overlay
        or setting == Options.icon_overlay_entity
        then
      overlay_sprites(obj, icon_to_sprite(icon), icon2 and icon_to_sprite(icon2))
    end
  end
end

local function do_replace_color(name, color)
  local setting = config(name .. "-color")
  if setting ~= "" then
    for key, value in pairs(util.color(setting)) do
      color[key] = value
    end
  end
end

local function do_replace_wire_sprite(name)
  local setting = config(name .. "-sprite-color")
  if setting ~= "" then
    local color = util.color(setting)
    local sprite = data.raw["utility-sprites"].default[name]
    sprite.filename = ModPath.."/graphics/base-wire.png"
    sprite.hr_version.filename = ModPath.."/graphics/hr-base-wire.png"
    sprite.tint = color
    sprite.hr_version.tint = color
  end
end

local function do_replace_button_background(config_name, default, button_name)
  local setting = config(config_name)
  if setting ~= default then
    data.raw["gui-style"].default[button_name].default_graphical_set.position = OldButtonBackgrounds[setting]
  end
end

local function do_replace_tech_background(config_name, default, tech_name)
  local setting = config(config_name)
  if setting ~= default then
    local color = NewSlotBackgrounds[setting]
    local tech = data.raw["gui-style"].default[tech_name]

    tech.default_graphical_set.base.position = color.default
    tech.disabled_graphical_set.base.position = color.default
    tech.highlighted_graphical_set.base.position = color.highlighted
    tech.clicked_graphical_set.base.position = color.selected
    tech.hovered_graphical_set.base.position = color.selected
    tech.selected_graphical_set.base.position = color.selected
    tech.selected_clicked_graphical_set.base.position = color.selected
    tech.selected_hovered_graphical_set.base.position = color.selected
    tech.level_band.position = color.level_band
    tech.hovered_level_band.position = color.level_band
    tech.level_range_band.position = color.level_range
    tech.hovered_level_range_band.position = color.level_range
  end
end


do_replace_icon("item", "copper-cable")
do_replace_icon("item", "copper-plate")
do_replace_icon("virtual-signal", "signal-each")
do_replace_icon("virtual-signal", "signal-everything")
if config("signal-colors") then
  for _, signal in pairs(SignalColors) do
    replace_icon(data.raw["virtual-signal"][signal], CustomIcons[signal])
  end
end

do_replace_or_overlay_icon("item", "advanced-circuit", Overlays["tier-2"])
do_replace_or_overlay_icon("item", "electronic-circuit", Overlays["tier-1"])
do_overlay_icon("item", "processing-unit", Overlays["tier-3"])

do_replace_or_overlay_icon("item", "green-wire", Overlays["green-wire-text-custom"])
do_overlay_icon("item", "red-wire", Overlays["red-wire-text-custom"])

do_replace_wire_sprite("copper_wire")
do_replace_wire_sprite("green_wire")
do_replace_wire_sprite("red_wire")

do_replace_button_background("green-circuit-background-color", "green", "green_circuit_network_content_slot")
do_replace_button_background("red-circuit-background-color", "red", "red_circuit_network_content_slot")

do_overlay_entity_icon("assembling-machine", "assembling-machine-1", Overlays["tier-1"])
do_overlay_entity_icon("assembling-machine", "assembling-machine-2", Overlays["tier-2"])
do_overlay_entity_icon("assembling-machine", "assembling-machine-3", Overlays["tier-3"])
do_overlay_entity_icon("loader", "express-loader", Overlays["tier-3"])
do_overlay_entity_icon("loader", "fast-loader", Overlays["tier-2"])
do_overlay_entity_icon("loader", "loader", Overlays["tier-1"])
do_overlay_entity_icon("splitter", "express-splitter", Overlays["tier-3"])
do_overlay_entity_icon("splitter", "fast-splitter", Overlays["tier-2"])
do_overlay_entity_icon("splitter", "splitter", Overlays["tier-1"])
do_overlay_entity_icon("transport-belt", "express-transport-belt", Overlays["tier-3"])
do_overlay_entity_icon("transport-belt", "fast-transport-belt", Overlays["tier-2"])
do_overlay_entity_icon("transport-belt", "transport-belt", Overlays["tier-1"])
do_overlay_entity_icon("underground-belt", "express-underground-belt", Overlays["tier-3"])
do_overlay_entity_icon("underground-belt", "fast-underground-belt", Overlays["tier-2"])
do_overlay_entity_icon("underground-belt", "underground-belt", Overlays["tier-1"])

do_overlay_icon("blueprint", "blueprint")
do_overlay_icon("deconstruction-item", "deconstruction-planner")
do_overlay_icon("upgrade-item", "upgrade-planner")

do_overlay_icon("item", "nuclear-fuel", Overlays["nuclear"])
do_overlay_icon("item", "uranium-235", Overlays["nuclear"])
do_overlay_icon("item", "uranium-fuel-cell", Overlays["nuclear"])
do_overlay_icon("ammo", "uranium-cannon-shell", Overlays["nuclear"])
do_overlay_icon("ammo", "uranium-rounds-magazine", Overlays["nuclear"])
do_overlay_icon("ammo", "atomic-bomb", Overlays["nuclear"])

do_overlay_icon("ammo", "explosive-cannon-shell", Overlays["explosives"])
do_overlay_icon("ammo", "explosive-rocket", Overlays["explosives"])
do_overlay_icon("capsule", "cluster-grenade", Overlays["explosives"])

do_overlay_icon("capsule", "cliff-explosives", Overlays["cliff"])

do_overlay_icon(
  "ammo", "explosive-uranium-cannon-shell",
  Overlays["nuclear"],
  table_merge(Overlays["explosives"], BaseOverlays.shifted)
)

-- TODO: improve graphic.
do_overlay_icon("ammo", "piercing-rounds-magazine", Overlays["piercing"])
do_overlay_icon("ammo", "piercing-shotgun-shell", Overlays["piercing"])

if do_overlay_icon("module", "productivity-module", Overlays["productivity"]) then
  overlay_icon(data.raw.module["productivity-module-2"], Overlays["productivity"])
  overlay_icon(data.raw.module["productivity-module-3"], Overlays["productivity"])
end

if do_overlay_icon("module", "effectivity-module", Overlays["effectivity"]) then
  overlay_icon(data.raw.module["effectivity-module-2"], Overlays["effectivity"])
  overlay_icon(data.raw.module["effectivity-module-3"], Overlays["effectivity"])
end

if do_overlay_icon("module", "speed-module", Overlays["speed"]) then
  overlay_icon(data.raw.module["speed-module-2"], Overlays["speed"])
  overlay_icon(data.raw.module["speed-module-3"], Overlays["speed"])
end

do_overlay_icon("capsule", "slowdown-capsule", Overlays["speed"])

-- Logistics
do_overlay_entity_icon("logistic-container", "logistic-chest-active-provider", Overlays["pushes"])
do_overlay_entity_icon("logistic-container", "logistic-chest-passive-provider", Overlays["generates"])
do_overlay_entity_icon("logistic-container", "logistic-chest-buffer", Overlays["buffer"])
do_overlay_entity_icon("logistic-container", "logistic-chest-requester", Overlays["consumes"])
do_overlay_entity_icon("logistic-container", "logistic-chest-storage", Overlays["storage"])

-- Science
do_overlay_icon("tool", "automation-science-pack", Overlays["iron-gear-wheel"])
do_overlay_icon("tool", "logistic-science-pack", Overlays["inserter"])
do_overlay_icon("tool", "military-science-pack", Overlays["piercing-rounds-magazine"])
do_overlay_icon("tool", "chemical-science-pack", Overlays["sulfuric-acid"])
do_overlay_icon("tool", "production-science-pack", Overlays["productivity-module"])
do_overlay_icon("tool", "utility-science-pack", Overlays["processing-unit"])
do_overlay_icon("tool", "space-science-pack", Overlays["satellite"])

-- Inserters
do_overlay_entity_icon("inserter", "burner-inserter", Overlays["coal"])
do_overlay_entity_icon("inserter", "fast-inserter", Overlays["speed"])
do_overlay_entity_icon("inserter", "filter-inserter", Overlays["filter"])
do_overlay_entity_icon("inserter", "long-handed-inserter", Overlays["pushes"])
do_overlay_entity_icon("inserter", "stack-inserter", Overlays["storage"])
do_overlay_entity_icon("inserter", "stack-filter-inserter",
  Overlays["storage"],
  table_merge(Overlays["filter"], BaseOverlays.shifted)
)

-- Ores
local copper_overlay = config("copper-plate") and Overlays["copper-plate-custom"] or Overlays["copper-plate"]
do_overlay_icon("item", "copper-ore", copper_overlay)
do_overlay_icon("item", "iron-ore", Overlays["iron-plate"])
do_overlay_icon("item", "stone", Overlays["stone-brick"])
do_overlay_icon("item", "uranium-ore", Overlays["uranium"])

-- Fluids
local advanced_oil_processing = false
local basic_oil_processing = false
local heavy_oil_cracking = false
local light_oil_cracking = false

local oil_overlay = Overlays["pumpjack"]
if do_overlay_icon("fluid", "crude-oil", oil_overlay) then
  overlay_icon(data.raw.item["crude-oil-barrel"], oil_overlay)
  overlay_fluid_barreling("crude-oil")
  advanced_oil_processing = true
  basic_oil_processing = true
end

local lube_overlay = Overlays["iron-gear-wheel"]
if do_overlay_icon("fluid", "lubricant", lube_overlay) then
  overlay_icon(data.raw.item["lubricant-barrel"], lube_overlay)
  overlay_fluid_barreling("lubricant")
end

if config("petroleum-gas") then
  overlay_icon(data.raw.item["petroleum-gas-barrel"], Overlays["petroleum-gas"])
end
if config("sulfuric-acid") then
  overlay_icon(data.raw.item["sulfuric-acid-barrel"], Overlays["sulfuric-acid"])
end

if overlay_or_replace_fluid("heavy-oil") then
  advanced_oil_processing = true
  heavy_oil_cracking = true
end
if overlay_or_replace_fluid("light-oil") then
  advanced_oil_processing = true
  heavy_oil_cracking = true
  light_oil_cracking = true
end
if overlay_or_replace_fluid("water") then
  advanced_oil_processing = true
end

-- Fluid recipes
if advanced_oil_processing then
  local recipe = data.raw.recipe["advanced-oil-processing"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", {0, 8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", {-12, 8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {12, 8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("water", {-4.5, -8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", {4.5, -8}, 0.5))
end

if basic_oil_processing then
  local recipe = data.raw.recipe["basic-oil-processing"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", {0, 8}, 0.75))
  overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", {0, -7.5}, 0.65))
end

if heavy_oil_cracking then
  local recipe = data.raw.recipe["heavy-oil-cracking"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {-8, 8}, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {8, 8}, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", {0, -4.5}, 0.6))
end

if light_oil_cracking then
  local recipe = data.raw.recipe["light-oil-cracking"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", {-8, 8}, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", {8, 8}, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {0, -4.5}, 0.6))
end

-- Train stop
if config("train-stop-signal-red") then
  local prototype = data.raw["train-stop"]["train-stop"]
  local sprite = icon_to_sprite(Overlays["no-entry"], 0.25)
  overlay_sprites(prototype.light1, icon_to_sprite(Overlays["no-entry"], 0.25))
  overlay_sprites(prototype.light2, icon_to_sprite(Overlays["no-entry"], 0.25))
end

-- Chain signal
-- The frame_sequence param is ignored; have to use stripes.
if config("rail-chain-signal-blue")
    or config("rail-chain-signal-green")
    or config("rail-chain-signal-red")
    or config("rail-chain-signal-yellow") then
  local animation = data.raw["rail-chain-signal"]["rail-chain-signal"].animation

  local stripe = {
    filename = SpritePath .. "rail-chain-signal/rail-chain-signal.png",
    width_in_frames = 1,
  }
  local hr_stripe = {
    filename = SpritePath .. "rail-chain-signal/hr-rail-chain-signal.png",
    width_in_frames = 1,
  }
  local sprite_sheet = table.deepcopy(animation.layers[1])

  sprite_sheet.stripes = {
    stripe,
    config("rail-chain-signal-red") and table_merge(stripe, {x=160}) or stripe,
    config("rail-chain-signal-yellow") and table_merge(stripe, {x=320}) or stripe,
    config("rail-chain-signal-green") and table_merge(stripe, {x=480}) or stripe,
    config("rail-chain-signal-blue") and table_merge(stripe, {x=640}) or stripe,
  }
  sprite_sheet.hr_version.stripes = {
    hr_stripe,
    config("rail-chain-signal-red") and table_merge(hr_stripe, {x=320}) or hr_stripe,
    config("rail-chain-signal-yellow") and table_merge(hr_stripe, {x=640}) or hr_stripe,
    config("rail-chain-signal-green") and table_merge(hr_stripe, {x=960}) or hr_stripe,
    config("rail-chain-signal-blue") and table_merge(hr_stripe, {x=1280}) or hr_stripe,
  }

  table.insert(animation.layers, sprite_sheet)
end

-- Custom GUI colors
local chart_colors = data.raw["utility-constants"].default.chart
do_replace_color("artillery_range", chart_colors.artillery_range_color)
do_replace_color("capsule_range", data.raw["utility-constants"].default.capsule_range_visualization_color)
do_replace_color("enemy", chart_colors.default_enemy_color)
do_replace_color("pollution", chart_colors.pollution_color)
do_replace_color("turret_range", data.raw["utility-constants"].default.turret_range_visualization_color)
do_replace_color("turret_range_map", chart_colors.turret_range_color)

-- Custom tech background colors
do_replace_tech_background("available-technology-background-color", "light_orange", "available_technology_slot")
do_replace_tech_background("conditionally-available-technology-background-color", "orange", "conditionally_available_technology_slot")
do_replace_tech_background("unavailable-technology-background-color", "red", "unavailable_technology_slot")
do_replace_tech_background("researched-technology-background-color", "green", "researched_technology_slot")
do_replace_tech_background("disabled-technology-background-color", "grey", "disabled_technology_slot")
