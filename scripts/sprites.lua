require("scripts/utils")

-- Shifts a sprite based on how large the base sprite is. This will help keep
-- the target sprite in the same area no matter how weirdly sized the base
-- sprite is.
local function shift_overlay_sprite(base_sprite, target_sprite)
  if base_sprite.layers then
    return shift_overlay_sprite(base_sprite.layers[1], target_sprite)
  end

  local shift = {
    base_sprite.shift[1] + target_sprite.shift[1] * (base_sprite.width or base_sprite.size) / 32,
    base_sprite.shift[2] + target_sprite.shift[2] * (base_sprite.height or base_sprite.size) / 32,
  }
  return table_merge(target_sprite, { shift = shift })
end

-- Overlay a sprite object with one or two sprites in layers.
local function overlay_sprite(obj, sprite, sprite2)
  if not obj.layers then
    obj.layers = { table.deepcopy(obj) }
  end
  table.insert(obj.layers, sprite)
  if sprite2 then
    table.insert(obj.layers, sprite2)
  end
end

-- Overlay a sprite over an array of pictures, which is used for ground rendering.
-- If an item has a single picture, it is likely it has a light layer.
-- If it had no layers, it would not have a separate picture from the icon.
function overlay_sprite_variation(obj, sprite, sprite2)
  if obj.filename or obj.layers then
    overlay_sprite(obj, sprite, sprite2)
  else
    for _, picture in pairs(obj) do
      overlay_sprite(picture, sprite, sprite2)
    end
  end
end

-- Overlay a static sprite over an Animation.
-- Does not support stripes.
local function overlay_animation(obj, sprite, sprite2)
  local base = obj.layers and obj.layers[1] or obj
  local props = {
    repeat_count = base.frame_count,
  }
  overlay_sprite(
    obj,
    table_merge(shift_overlay_sprite(base, sprite), props),
    sprite2 and table_merge(shift_overlay_sprite(base, sprite2), props)
  )
end

-- Overlay a static sprite over an Animation4Way.
-- Does not support stripes.
local function overlay_animation4way(obj, sprite, sprite2)
  if obj.north then
    for _, _type in pairs({
      "north",
      "east",
      "west",
      "south",
    }) do
      if obj[_type] then
        overlay_animation(obj[_type], sprite, sprite2)
      end
    end
  else
    overlay_animation(obj, sprite, sprite2)
  end
end

-- Overlay a static sprite over an RotatedAnimation for a belt.
-- A terrible hack, but the game requires a sprite per direction, even if
-- they are all exactly the same.
local function overlay_belt_animation(obj, sprite)
  if not obj.layers then
    obj.layers = { table.deepcopy(obj) }
  end
  local props = {
    frame_count = 1,
    line_length = 1,
    lines_per_file = 1,
    slice = 1,
    repeat_count = obj.layers[1].frame_count,
    direction_count = 20,
    filenames = {},
  }
  for i = 1, 12 do
    table.insert(props.filenames, sprite.filename)
  end
  for i = 1, 8 do
    table.insert(props.filenames, EmptyConstant.icon)
  end
  table.insert(obj.layers, table_merge(sprite, props))
end

-- Overlay a static sprite over a Sprite4Way.
local function overlay_sprite4way(obj, sprite, sprite2)
  if obj.sheet and not obj.sheets then
    obj.sheets = { obj.sheet }
    obj.sheet = nil
  end
  if obj.sheets then
    table.insert(obj.sheets, table_merge(sprite, { frames = 1 }))
    if sprite2 then
      table.insert(obj.sheets, table_merge(sprite2, { frames = 1 }))
    end
  else
    for _, _type in pairs({
      "north",
      "east",
      "west",
      "south",
    }) do
      overlay_sprite(
        obj[_type],
        shift_overlay_sprite(obj[_type], sprite),
        sprite2 and shift_overlay_sprite(obj[_type], sprite2)
      )
    end
  end
end

function overlay_sprites(obj, sprite, sprite2)
  if obj.animation then
    overlay_animation(obj.animation, sprite, sprite2)
  end
  if obj.platform_picture then
    overlay_sprite4way(obj.platform_picture, sprite, sprite2)
  end
  if obj.red_picture then
    overlay_sprite4way(obj.red_picture, sprite, sprite2)
  end
  if obj.structure then
    for _, _type in pairs({
      "direction_in",
      "direction_in_side_loading",
      "direction_out",
      "direction_out_side_loading",
    }) do
      if obj.structure[_type] then
        overlay_sprite4way(obj.structure[_type], sprite, sprite2)
      end
    end
    if obj.structure.north then
      overlay_animation4way(obj.structure, sprite, sprite2)
    end
  end
  -- Need to filter to transport belts because other objects share the same
  -- animation sets and will infect the transport belt of the same tier.
  if obj.type == "transport-belt" and obj.belt_animation_set then
    overlay_belt_animation(obj.belt_animation_set.animation_set, sprite)
  end
end

-- Replace a sprite with a custom sprite.
function replace_sprite(obj, filename, hr_filename)
  if obj.type == "underground-belt" or obj.type == "loader" then
    for _, _type in pairs({
      "direction_in",
      "direction_out",
      "direction_in_side_loading",
      "direction_out_side_loading",
    }) do
      if obj.structure[_type] then
        local sheet = obj.structure[_type].sheet
        sheet.filename = filename
        if sheet.hr_version then
          sheet.hr_version.filename = hr_filename
        end
      end
    end
  end
end

-- Convert an icon format to a sprite format. Used when the on ground icon does
-- not match the inventory icon, because then it is a sprite/picture, or for
-- rendering an entity.
function icon_to_sprite(icon, scale)
  scale = scale or 1
  local sprite = {
    filename = icon["icon"],
    size = icon["icon_size"],
    mipmaps = icon["icon_mipmaps"],
    scale = icon["scale"] * scale,
  }
  if icon["shift"] ~= nil then
    sprite["shift"] = {
      icon["shift"][1] * 0.03 * scale,
      icon["shift"][2] * 0.03 * scale,
    }
  end
  return sprite
end
