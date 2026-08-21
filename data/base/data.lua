require("scripts.config")
require("scripts.icons")
require("scripts.icon_overlays")
require("scripts.fluids")
require("scripts.sprites")
require("scripts.updates")
require("data.base.constants")
require("data.core.utils")

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
  local prototype = data:get("rail-chain-signal", "rail-chain-signal")
  if prototype then
    local stripe = {
      filename = SpritePath .. "rail-chain-signal/rail-chain-signal.png",
      width_in_frames = 1,
    }
    local animation = prototype.ground_picture_set.structure
    local sprite_sheet = table.deepcopy(animation.layers[1])

    sprite_sheet.stripes = {
      config("rail-chain-signal-red") and table_merge(stripe, { x = 100 }) or stripe,
      config("rail-chain-signal-yellow") and table_merge(stripe, { x = 200 }) or stripe,
      config("rail-chain-signal-green") and table_merge(stripe, { x = 300 }) or stripe,
      config("rail-chain-signal-blue") and table_merge(stripe, { x = 400 }) or stripe,
    }

    table.insert(animation.layers, sprite_sheet)
  end
end

if config("pollution-map-color") then
  local prototype = data:get("airborne-pollutant", "pollution") --[[@as data.AirbornePollutantPrototype]]
  local color_setting = config("pollution-map-color") --[[@as Color]]
  if prototype and not color_equals(color_setting, prototype.chart_color) then
    prototype.chart_color = color_setting
  end
end

update_resource_color("coal")
update_resource_color("copper-ore")
update_resource_color("crude-oil")
update_resource_color("iron-ore")
update_resource_color("stone")
update_resource_color("uranium-ore")

do_if_color_setting("beacon-visualization", function(color)
  update_radius_visualization_color("beacon", "beacon", color)
end)

do_if_color_setting("electric-pole-visualization", function(color)
  update_radius_visualization_color("electric-pole", "small-electric-pole", color)
  update_radius_visualization_color("electric-pole", "medium-electric-pole", color)
  update_radius_visualization_color("electric-pole", "big-electric-pole", color)
  update_radius_visualization_color("electric-pole", "substation", color)
end)

do_if_color_setting("mining-drill-visualization", function(color)
  update_radius_visualization_color("mining-drill", "electric-mining-drill", color)
  update_radius_visualization_color("mining-drill", "pumpjack", color)
end)

do_if_color_setting("acid-splash", function(color)
  for _, prototype in pairs(data.raw["fire"]) do
    if prototype.pictures then
      for i = 1, 4 do
        if
          prototype.pictures[i]
          and prototype.pictures[i].layers
          and prototype.pictures[i].layers[1]
          and prototype.pictures[i].layers[1].filename
            == "__base__/graphics/entity/acid-splash/acid-splash-" .. i .. ".png"
        then
          prototype.pictures[i].layers[1].tint = color
        end
      end
    end
    if prototype.secondary_pictures then
      for i = 1, 4 do
        if
          prototype.secondary_pictures[i]
          and prototype.secondary_pictures[i].layers
          and prototype.secondary_pictures[i].layers[1]
          and prototype.secondary_pictures[i].layers[1].filename
            == "__base__/graphics/entity/acid-splash/acid-splash-" .. i .. ".png"
        then
          -- 0.7 Source: __base__/prototypes/entity/enemy-constants.lua#L145
          prototype.secondary_pictures[i].layers[1].tint = util.multiply_color(color, 0.7)
        end
      end
    end
  end
end)
do_if_color_setting("acid-stream", function(color)
  for _, prototype in pairs(data.raw["stream"]) do
    if
      prototype.particle
      and prototype.particle
      and prototype.particle.filename == "__base__/graphics/entity/acid-projectile/acid-projectile-head.png"
    then
      prototype.particle.tint = color
    end
    if
      prototype.spine_animation
      and prototype.spine_animation
      and prototype.spine_animation.filename == "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png"
    then
      prototype.spine_animation.tint = color
    end
  end
end)
do_if_color_setting("acid-sticker", function(color)
  for _, prototype in pairs(data.raw["sticker"]) do
    if
      prototype.animation
      and prototype.animation
      and prototype.animation.filename == "__base__/graphics/entity/acid-sticker/acid-sticker.png"
    then
      prototype.animation.tint = color
    end
  end
end)

---Change the tint on a spawner or spawner corpse entity's animations.
---@param animations? [data.Animation|data.RotatedAnimation]
---@param default_color Color
---@param color Color
function tint_spawner_animations(animations, default_color, color)
  if animations and animations[1] then
    for _, animation in pairs(animations) do
      for _, layer in pairs(animation.layers) do
        if layer.tint and color_equals(layer.tint, default_color) then
          layer.tint = color
        end
      end
    end
  end
end

---Change the tint on a spawner or spawner corpse entity.
---@param prototype? data.EnemySpawnerPrototype|data.CorpsePrototype
---@param default_color Color
---@param color Color
function tint_spawner(prototype, default_color, color)
  if prototype then
    if prototype.graphics_set then
      tint_spawner_animations(prototype.graphics_set.animations, default_color, color)
    end
    tint_spawner_animations(prototype.animation, default_color, color)
    tint_spawner_animations(prototype.decay_animation, default_color, color)
  end
end

do_if_color_setting("biter_spawner", function(color)
  tint_spawner(data.raw.corpse["biter-spawner-corpse"], DefaultColors.biter_spawner, color)
  tint_spawner(data.raw["unit-spawner"]["biter-spawner"], DefaultColors.biter_spawner, color)
end)
do_if_color_setting("spitter_spawner", function(color)
  tint_spawner(data.raw.corpse["spitter-spawner-corpse"], DefaultColors.spitter_spawner, color)
  tint_spawner(data.raw["unit-spawner"]["spitter-spawner"], DefaultColors.spitter_spawner, color)
end)
