require("scripts/utils")

IconPath = ModPath .. "/graphics/icons/"
BaseIconPath = "__base__/graphics/icons/"
CoreIconPath = "__core__/graphics/icons/"

-- Overwrite a default icon.
function replace_icon(_type, item, icon)
  data.raw[_type][item].icons = {icon}
  data.raw[_type][item].icon = nil
end

-- Overlay an icon on top of the base icon.
function overlay_icon(_type, item, icon, icon2)
  local obj = data.raw[_type][item]
  if not obj.icons then
    obj.icons = {
      {
        icon = obj.icon,
        icon_size = obj.icon_size,
        icon_mipmaps = obj.icon_mipmaps,
      }
    }
    obj.icon = nil
  end
  table.insert(obj.icons, icon)

  if icon2 then
    table.insert(obj.icons, icon2)
  end
end

Icons = {}

local function create_icon(name, path)
  table.insert(Icons, name, {
    icon = path,
    icon_size = 64,
    icon_mipmaps = 4,
  })
end

local function create_custom_icon(name)
  create_icon(name .. "-custom", IconPath .. name .. ".png")
end

create_icon("copper-plate", BaseIconPath .. "copper-plate.png")
create_custom_icon("copper-plate")
create_custom_icon("electronic-circuit")
