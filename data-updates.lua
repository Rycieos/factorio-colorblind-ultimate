require("scripts/config")
require("scripts/fluids")
require("scripts/icons")
require("scripts/icon_overlays")
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
    overlay_icon(data.raw[_type][name], icon, icon2)
    return true
  end
  return false
end

local function do_overlay_icon_and_picture(_type, name, icon, icon2)
  icon = icon or Overlays[name]
  if config(name) then
    local obj = data.raw[_type][name]
    overlay_icon(obj, icon, icon2)
    overlay_pictures(
      obj,
      icon_to_sprite(icon, 0.5),
      icon2 and icon_to_sprite(icon2, 0.5)
    )
  end
end

local function do_overlay_entity_icon(_type, name, icon, icon2)
  if config(name) then
    local obj = data.raw[_type][name]
    overlay_icon(obj, icon, icon2)
    overlay_icon(data.raw.item[obj.minable.result], icon, icon2)
    overlay_sprite(obj, icon_to_sprite(icon), icon2 and icon_to_sprite(icon2))
  end
end


do_replace_icon("item", "copper-plate")
do_replace_icon("item", "electronic-circuit")

do_overlay_icon("blueprint", "blueprint")
do_overlay_icon("deconstruction-item", "deconstruction-planner")
do_overlay_icon("upgrade-item", "upgrade-planner")

do_overlay_icon_and_picture("item", "nuclear-fuel", Overlays["nuclear"])
do_overlay_icon_and_picture("item", "uranium-235", Overlays["nuclear"])
do_overlay_icon_and_picture("item", "uranium-fuel-cell", Overlays["nuclear"])
do_overlay_icon_and_picture("ammo", "uranium-cannon-shell", Overlays["nuclear"])
do_overlay_icon_and_picture("ammo", "uranium-rounds-magazine", Overlays["nuclear"])
do_overlay_icon_and_picture("ammo", "atomic-bomb", Overlays["nuclear"])

do_overlay_icon("ammo", "explosive-cannon-shell", Overlays["explosives"])
do_overlay_icon("ammo", "explosive-rocket", Overlays["explosives"])
do_overlay_icon("capsule", "cluster-grenade", Overlays["explosives"])

do_overlay_icon("capsule", "cliff-explosives", Overlays["cliff"])

do_overlay_icon_and_picture(
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
do_overlay_icon_and_picture("item", "copper-ore", copper_overlay)
do_overlay_icon_and_picture("item", "iron-ore", Overlays["iron-plate"])
do_overlay_icon_and_picture("item", "stone", Overlays["stone-brick"])
do_overlay_icon_and_picture("item", "uranium-ore", Overlays["uranium"])

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
  overlay_icon(data.raw.item["lubricant-barrel"], table.deepcopy(lube_overlay))
  overlay_fluid_barreling("lubricant")
else
  error("no lube")
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
