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
    local prototype = data:get("virtual-signal", signal)
    if prototype then
      replace_icon(prototype, {
        icon = IconPath .. "signal/" .. signal .. ".png",
        icon_size = 64,
        icon_mipmaps = 4,
      })
    end
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
  local recipe = data:get("recipe", "advanced-oil-processing")
  if recipe then
    replace_icon(recipe, EmptyIcon)
    overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { 0, 8 }, 0.5))
    overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", { -12, 8 }, 0.5))
    overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { 12, 8 }, 0.5))
    overlay_icon(recipe, get_and_shift_fluid_icons("water", { -4.5, -8 }, 0.5))
    overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", { 4.5, -8 }, 0.5))
  end
end

if prototypes["crude-oil"].enabled or prototypes["petroleum-gas"].enabled then
  local recipe = data:get("recipe", "basic-oil-processing")
  if recipe then
    replace_icon(recipe, EmptyIcon)
    overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { 0, 8 }, 0.75))
    overlay_icon(recipe, get_and_shift_fluid_icons("crude-oil", { 0, -7.5 }, 0.65))
  end
end

if prototypes["heavy-oil"].enabled or prototypes["light-oil"].enabled then
  local recipe = data:get("recipe", "heavy-oil-cracking")
  if recipe then
    replace_icon(recipe, EmptyIcon)
    overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { -8, 8 }, 0.55))
    overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { 8, 8 }, 0.55))
    overlay_icon(recipe, get_and_shift_fluid_icons("heavy-oil", { 0, -4.5 }, 0.6))
  end
end

if prototypes["light-oil"].enabled or prototypes["petroleum-gas"].enabled then
  local recipe = data:get("recipe", "light-oil-cracking")
  if recipe then
    replace_icon(recipe, EmptyIcon)
    overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { -8, 8 }, 0.55))
    overlay_icon(recipe, get_and_shift_fluid_icons("petroleum-gas", { 8, 8 }, 0.55))
    overlay_icon(recipe, get_and_shift_fluid_icons("light-oil", { 0, -4.5 }, 0.6))
  end
end

-- Train stop
if config("train-stop-signal-red") then
  local prototype = data:get("train-stop", "train-stop")
  if prototype then
    local sprite = icon_to_sprite(Overlays["no-entry"], 0.25)
    overlay_sprites(prototype.light1, sprite)
    overlay_sprites(prototype.light2, sprite)
  end
end

-- Chain signal
-- The frame_sequence param is ignored; have to use stripes.
if
  config("rail-chain-signal-blue")
  or config("rail-chain-signal-green")
  or config("rail-chain-signal-red")
  or config("rail-chain-signal-yellow")
then
  local prototype = data:get("rail-signal", "rail-chain-signal")
  if prototype then
    local stripe = {
      filename = SpritePath .. "rail-chain-signal/rail-chain-signal.png",
      width_in_frames = 1,
    }
    local sprite_sheet = table.deepcopy(prototype.animation.layers[1])

    sprite_sheet.stripes = {
      stripe,
      config("rail-chain-signal-red") and table_merge(stripe, { x = 320 }) or stripe,
      config("rail-chain-signal-yellow") and table_merge(stripe, { x = 640 }) or stripe,
      config("rail-chain-signal-green") and table_merge(stripe, { x = 960 }) or stripe,
      config("rail-chain-signal-blue") and table_merge(stripe, { x = 1280 }) or stripe,
    }

    table.insert(prototype.animation.layers, sprite_sheet)
    --local sprite_sheet = table.deepcopy(prototype.animation)

    --sprite_sheet.stripes = {
    --  stripe,
    --  config("rail-chain-signal-red") and table_merge(stripe, { x = 320 }) or stripe,
    --  config("rail-chain-signal-yellow") and table_merge(stripe, { x = 640 }) or stripe,
    --  config("rail-chain-signal-green") and table_merge(stripe, { x = 960 }) or stripe,
    --  config("rail-chain-signal-blue") and table_merge(stripe, { x = 1280 }) or stripe,
    --}

    --prototype.animation = {
    --  layers = {
    --    prototype.animation,
    --    sprite_sheet,
    --  }
    --}
  end
end
