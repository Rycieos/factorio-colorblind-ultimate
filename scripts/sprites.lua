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
  if not obj.animation.layers then
    obj.animation.layers = {obj.animation}
  end
  local frame_count = obj.animation.layers[1].frame_count
  table.insert(obj.animation.layers, table_merge(sprite, {repeat_count = frame_count}))
  if sprite2 then
    table.insert(obj.animation.layers, table_merge(sprite2, {repeat_count = frame_count}))
  end
end

-- Overlay a static sprite over a platform picture.
local function overlay_platform_picture(obj, sprite, sprite2)
  if not obj.platform_picture.sheets then
    obj.platform_picture.sheets = {obj.platform_picture.sheet}
    obj.platform_picture.sheet = nil
  end
  table.insert(obj.platform_picture.sheets, table_merge(sprite, {frames = 1}))
  if sprite2 then
    table.insert(obj.platform_picture.sheets, table_merge(sprite2, {frames = 1}))
  end
end

function overlay_sprite(obj, sprite, sprite2)
  if obj.animation then
    overlay_animation(obj, sprite, sprite2)
  end
  if obj.platform_picture then
    overlay_platform_picture(obj, sprite, sprite2)
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
