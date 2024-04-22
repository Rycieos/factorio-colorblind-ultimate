require("scripts/utils")

-- Overlay a sprite over an array of pictures, which is used for ground rendering.
-- If an item has a single picture, it is likely it has a light layer.
-- If it had no layers, it would not have a separate picture from the icon.
function overlay_pictures(obj, sprite, sprite2)
  if obj.pictures.filename then
    obj.pictures = {layers = {obj.pictures}}
  end
  if obj.pictures.layers then
    table.insert(obj.pictures.layers, sprite)
    if sprite2 then
      table.insert(obj.pictures.layers, sprite2)
    end
  else
    local pictures = {}
    for _, picture in ipairs(obj.pictures) do
      local layers = picture.layers or {picture}
      table.insert(layers, sprite)
      if sprite2 then
        table.insert(layers, sprite2)
      end
      table.insert(pictures, {layers = layers})
    end
    obj.pictures = pictures
  end
end

-- Overlay a static sprite over an animation.
local function overlay_animation(obj, sprite, sprite2)
  if not obj.layers then
    obj.layers = {table.deepcopy(obj)}
  end
  local props = {
    repeat_count = obj.layers[1].frame_count,
  }
  table.insert(obj.layers, table_merge(sprite, props))
  if sprite2 then
    table.insert(obj.layers, table_merge(sprite2, props))
  end
end

-- Overlay a static sprite over an RotatedAnimation.
-- A terrible hack, but the game requires a sprite per direction, even if
-- they are all exactly the same.
function overlay_rotated_animation(obj, sprite)
  if not obj.layers then
    obj.layers = {table.deepcopy(obj)}
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
  for i=1, 12 do
    table.insert(props.filenames, sprite.filename)
  end
  for i=1, 8 do
    table.insert(props.filenames, EmptyConstant.icon)
  end
  table.insert(obj.layers, table_merge(sprite, props))
end

-- Overlay a static sprite over a Sprite4Way.
local function overlay_sprite4way(obj, sprite, sprite2)
  if not obj.sheets then
    obj.sheets = {obj.sheet}
    obj.sheet = nil
  end
  table.insert(obj.sheets, table_merge(sprite, {frames = 1}))
  if sprite2 then
    table.insert(obj.sheets, table_merge(sprite2, {frames = 1}))
  end
end

function overlay_sprite(obj, sprite, sprite2)
  if obj.animation then
    overlay_animation(obj.animation, sprite, sprite2)
  end
  if obj.platform_picture then
    overlay_sprite4way(obj.platform_picture, sprite, sprite2)
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
    for _, _type in pairs({
      "north",
      "east",
      "west",
      "south",
    }) do
      if obj.structure[_type] then
        overlay_animation(obj.structure[_type], sprite, sprite2)
      end
    end
  end
  -- Need to filter to transport belts because other objects share the same
  -- animation sets and will infect the transport belt of the same tier.
  if obj.type == "transport-belt" and obj.belt_animation_set then
    overlay_rotated_animation(obj.belt_animation_set.animation_set, sprite)
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
