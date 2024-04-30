require("scripts/config")
require("scripts/fluids")
require("scripts/icon_overlays")
require("scripts/icons")
require("scripts/sprites")

local function do_replace_or_overlay(name, proto, config_name)
  local setting = config(config_name or name)
  if setting == Options.none then
    return false
  end

  local obj = data.raw[proto.type][name]
  if not obj then
    log("Warning: object ["..proto.type.."]["..name.."] not found")
    return false
  end

  local is_entity = proto.is_entity or proto.sprite_replacement

  if setting == Options.icon
      or setting == Options.entity
      or setting == Options.icon_and_entity
      then
    if setting ~= Options.entity then
      replace_icon(obj, CustomIcons[name])
      if is_entity then
        replace_icon(get_item_from_entity(obj), CustomIcons[name])
      end
    end
    if setting ~= Options.icon then
      replace_sprite(obj, proto.sprite_replacement, proto.hr_sprite_replacement)
    end
  else  -- Choose overlay
    local icon, icon2
    if setting == Options.text_overlay
        or setting == Options.text_overlay_entity
        or setting == Options.text_overlay_icon
        then
      icon = TextOverlays[proto.text_overlay]
      icon2 = proto.text_overlay2 and table_merge(TextOverlays[proto.text_overlay2], BaseOverlays.shifted)
    elseif proto.icon_overlay_from then
      icon, icon2 = table.unpack(create_overlay_from_icons(
        icons_from_obj(
          data.raw[proto.icon_overlay_from[1]][proto.icon_overlay_from[2]]
        )
      ))
    else
      icon = Overlays[proto.icon_overlay]
      icon2 = proto.icon_overlay2 and table_merge(Overlays[proto.icon_overlay2], BaseOverlays.shifted)
    end

    if setting ~= Options.icon_overlay_entity
        and setting ~= Options.tier_entity
        and setting ~= Options.text_overlay_entity
        then
      overlay_icon(obj, icon, icon2)
      if obj.pictures then
        overlay_sprite_variation(
          obj.pictures,
          icon_to_sprite(icon, 0.5),
          icon2 and icon_to_sprite(icon2, 0.5)
        )
      end
      if is_entity then
        overlay_icon(get_item_from_entity(obj), icon, icon2)
      end
    end
    if setting ~= Options.icon_overlay_icon
        and setting ~= Options.tier_icon
        and setting ~= Options.text_overlay_icon
        then
      if not icon then
        log(name)
      end
      overlay_sprites(obj, icon_to_sprite(icon), icon2 and icon_to_sprite(icon2))
    end
  end
  return true
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


local prototypes = require("data.base.prototypes")
for name, proto in pairs(prototypes) do
  if do_replace_or_overlay(name, proto) then
    if proto.nested_prototypes then
      for _, nested_name in ipairs(proto.nested_prototypes) do
        do_replace_or_overlay(nested_name, proto, name)
      end
    end
    if proto.hooks then
      for _, hook in ipairs(proto.hooks) do
        hook(name, proto)
      end
    end
    proto.enabled = true
  end
end

if config("signal-colors") then
  for _, signal in pairs(SignalColors) do
    replace_icon(data.raw["virtual-signal"][signal], CustomIcons[signal])
  end
end

do_replace_wire_sprite("copper_wire")
do_replace_wire_sprite("green_wire")
do_replace_wire_sprite("red_wire")

do_replace_button_background("green-circuit-background-color", "green", "green_circuit_network_content_slot")
do_replace_button_background("red-circuit-background-color", "red", "red_circuit_network_content_slot")


-- Fluid recipes
if prototypes["crude-oil"].enabled
    or prototypes["heavy-oil"].enabled
    or prototypes["light-oil"].enabled
    or prototypes["petroleum-gas"].enabled
    or prototypes["water"].enabled
    then
  local recipe = data.raw.recipe["advanced-oil-processing"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", {0, 8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", {-12, 8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {12, 8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("water", {-4.5, -8}, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", {4.5, -8}, 0.5))
end

if prototypes["crude-oil"].enabled
    or prototypes["petroleum-gas"].enabled
    then
  local recipe = data.raw.recipe["basic-oil-processing"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", {0, 8}, 0.75))
  overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", {0, -7.5}, 0.65))
end

if prototypes["heavy-oil"].enabled
    or prototypes["light-oil"].enabled
    then
  local recipe = data.raw.recipe["heavy-oil-cracking"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {-8, 8}, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", {8, 8}, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", {0, -4.5}, 0.6))
end

if prototypes["light-oil"].enabled
    or prototypes["petroleum-gas"].enabled
    then
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
