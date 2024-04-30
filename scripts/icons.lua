require("scripts/utils")

IconPath = ModPath .. "/graphics/icons/"
BaseIconPath = "__base__/graphics/icons/"
CoreIconPath = "__core__/graphics/icons/"

-- Overwrite a default icon.
function replace_icon(obj, icon)
  obj.icons = {icon}
  obj.icon = nil
end

-- Get an array of icons from an object, even if the array formatted "icons"
-- property is not set.
function icons_from_obj(obj)
  if obj.icons then
    return table.deepcopy(obj.icons)
  else
    return {{
      icon = obj.icon,
      icon_size = obj.icon_size,
      icon_mipmaps = obj.icon_mipmaps,
    }}
  end
end

-- Overlay an icon on top of the base icon.
function overlay_icon(obj, icon, icon2)
  if not obj.icons then
    obj.icons = icons_from_obj(obj)
    obj.icon = nil
  end
  table.insert(obj.icons, icon)

  if icon2 then
    table.insert(obj.icons, icon2)
  end
end

-- Used as a base icon for layering all not full size icons on top.
EmptyIcon = {
  icon = "__core__/graphics/empty.png",
  icon_size = 1,
  scale = 32,
}

-- Used as a base icon RotatedAnimations that need the same size everywhere.
EmptyConstant = {
  icon = IconPath .. "constants/empty.png",
  icon_size = 128,
  icon_mipmaps = 3,
}

function create_custom_icon(name, path)
  if type(path) ~= "string" then
    path = ""
  end
  return {
    icon = IconPath .. path .. name .. ".png",
    icon_size = 64,
    icon_mipmaps = 4,
  }
end
