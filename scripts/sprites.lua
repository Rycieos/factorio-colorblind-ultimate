
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

-- Convert an icon format to a sprite format. Used when the on ground icon does
-- not match the inventory icon, because then it is a sprite/picture.
function icon_to_sprite(icon)
  local sprite = {
    filename = icon["icon"],
    size = icon["icon_size"],
    mipmaps = icon["icon_mipmaps"],
  }
  if icon["scale"] ~= nil then
    sprite["scale"] = icon["scale"] / 2
  end
  if icon["shift"] ~= nil then
    sprite["shift"] = {
      icon["shift"][1] * 0.015,
      icon["shift"][2] * 0.015,
    }
  end
  return sprite
end
