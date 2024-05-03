require("scripts.icons")
require("scripts.icon_overlays")
require("scripts.fluids")
require("scripts.sprites")
require("scripts.updates")
require("data.base.constants")

local prototypes = require("data.base.prototypes")
apply_prototypes(prototypes)

if config("signal-colors") then
  for _, signal in pairs(SignalColors) do
    replace_icon(data.raw["virtual-signal"][signal], {
      icon = IconPath .. "signal/" .. signal .. ".png",
      icon_size = 64,
      icon_mipmaps = 4,
    })
  end
end

-- Fluid recipes
if
  prototypes["crude-oil"].enabled
  or prototypes["heavy-oil"].enabled
  or prototypes["light-oil"].enabled
  or prototypes["petroleum-gas"].enabled
  or prototypes["water"].enabled
then
  local recipe = data.raw.recipe["advanced-oil-processing"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { 0, 8 }, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", { -12, 8 }, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { 12, 8 }, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("water", { -4.5, -8 }, 0.5))
  overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", { 4.5, -8 }, 0.5))
end

if prototypes["crude-oil"].enabled or prototypes["petroleum-gas"].enabled then
  local recipe = data.raw.recipe["basic-oil-processing"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { 0, 8 }, 0.75))
  overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", { 0, -7.5 }, 0.65))
end

if prototypes["heavy-oil"].enabled or prototypes["light-oil"].enabled then
  local recipe = data.raw.recipe["heavy-oil-cracking"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { -8, 8 }, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { 8, 8 }, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", { 0, -4.5 }, 0.6))
end

if prototypes["light-oil"].enabled or prototypes["petroleum-gas"].enabled then
  local recipe = data.raw.recipe["light-oil-cracking"]
  replace_icon(recipe, EmptyIcon)
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { -8, 8 }, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { 8, 8 }, 0.55))
  overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { 0, -4.5 }, 0.6))
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
if
  config("rail-chain-signal-blue")
  or config("rail-chain-signal-green")
  or config("rail-chain-signal-red")
  or config("rail-chain-signal-yellow")
then
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
    config("rail-chain-signal-red") and table_merge(stripe, { x = 160 }) or stripe,
    config("rail-chain-signal-yellow") and table_merge(stripe, { x = 320 }) or stripe,
    config("rail-chain-signal-green") and table_merge(stripe, { x = 480 }) or stripe,
    config("rail-chain-signal-blue") and table_merge(stripe, { x = 640 }) or stripe,
  }
  sprite_sheet.hr_version.stripes = {
    hr_stripe,
    config("rail-chain-signal-red") and table_merge(hr_stripe, { x = 320 }) or hr_stripe,
    config("rail-chain-signal-yellow") and table_merge(hr_stripe, { x = 640 }) or hr_stripe,
    config("rail-chain-signal-green") and table_merge(hr_stripe, { x = 960 }) or hr_stripe,
    config("rail-chain-signal-blue") and table_merge(hr_stripe, { x = 1280 }) or hr_stripe,
  }

  table.insert(animation.layers, sprite_sheet)
end
