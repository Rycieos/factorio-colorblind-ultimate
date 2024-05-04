require("scripts/utils")

IconPath = ModPath .. "/graphics/icons/"
BaseIconPath = "__base__/graphics/icons/"
CoreIconPath = "__core__/graphics/icons/"

-- Overwrite a default icon.
function replace_icon(obj, icon)
  obj.icons = { icon }
  obj.icon = nil
end

-- Get an array of icons from an object, even if the array formatted "icons"
-- property is not set.
function icons_from_obj(obj)
  if obj.icons then
    return table.deepcopy(obj.icons)
  else
    return { {
      icon = obj.icon,
      icon_size = obj.icon_size,
      icon_mipmaps = obj.icon_mipmaps,
    } }
  end
end

-- Overlay an icon on top of the base icon.
function overlay_icon(obj, icon, icon2)
  if not obj.icons then
    obj.icons = icons_from_obj(obj)
  end
  -- Some mods (including base mod) mistakenly check this field first.
  obj.icon = nil
  table.insert(obj.icons, icon)

  if icon2 then
    table.insert(obj.icons, icon2)
  end
end

-- For some reason, the path to the file in the "dark" version of an icon is
-- a different field. Probably because it hasn't been changed since it was added.
function convert_to_dark_background_icon(icon)
  icon = table.deepcopy(icon)
  icon.dark_background_icon = icon.icon
  icon.icon = nil
  return icon
end

-- Overlay an icon on top of the base dark icon.
function overlay_dark_icon(obj, icon, icon2)
  if not obj.dark_background_icons then
    obj.dark_background_icons = {
      {
        dark_background_icon = obj.dark_background_icon,
        icon_size = obj.icon_size,
        icon_mipmaps = obj.icon_mipmaps,
      },
    }
  end
  obj.dark_background_icon = nil
  table.insert(obj.dark_background_icons, convert_to_dark_background_icon(icon))

  if icon2 then
    table.insert(obj.dark_background_icons, convert_to_dark_background_icon(icon2))
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
