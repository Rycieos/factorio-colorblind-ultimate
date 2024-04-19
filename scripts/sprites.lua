require("scripts/utils")

-- Overlay a sprite over a picture, which is used for ground rendering.
function overlay_picture(_type, item, sprite, sprite2)
  local obj = data.raw[_type][item]
  table.insert(obj.pictures.layers, sprite)
  if sprite2 then
    table.insert(obj.pictures.layers, sprite2)
  end
end

-- Overlay a sprite over an array of pictures, which is used for ground rendering.
function overlay_pictures(_type, item, sprite, sprite2)
  local obj = data.raw[_type][item]
  local pictures = {}
  for _, picture in ipairs(obj.pictures) do
    local layers = {picture, sprite}
    if sprite2 then
      table.insert(layers, sprite2)
    end
    table.insert(pictures, {layers = layers})
  end
  obj.pictures = pictures
end

-- Overlay a static sprite over an animation.
function overlay_animation(_type, item, sprite, sprite2)
  local obj = data.raw[_type][item]
  if not obj.animation.layers then
    obj.animation.layers = {obj.animation}
  end
  local frame_count = obj.animation.layers[1].frame_count
  table.insert(obj.animation.layers, table_merge(sprite, {repeat_count = frame_count}))
  if sprite2 then
    table.insert(obj.animation.layers, table_merge(sprite2, {repeat_count = frame_count}))
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
