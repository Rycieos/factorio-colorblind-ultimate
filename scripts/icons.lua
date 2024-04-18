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


CustomIcons = {}

local function create_custom_icon(name, path)
  CustomIcons[name] = {
    icon = IconPath .. (path and path or name) .. ".png",
    icon_size = 64,
    icon_mipmaps = 4,
  }
end

local function create_custom_fluid_icon(name)
  create_custom_icon(name, "fluid/" .. name)
end

local function create_custom_text_icon(name, path)
  CustomIcons[name .. "-text"] = {
    icon = IconPath .. "text/" .. path .. ".png",
    icon_size = 64,
    icon_mipmaps = 2,
  }
end

create_custom_icon("copper-plate")
create_custom_icon("electronic-circuit")

create_custom_fluid_icon("heavy-oil")
create_custom_fluid_icon("light-oil")
create_custom_fluid_icon("water")

create_custom_text_icon("heavy-oil", "h")
create_custom_text_icon("light-oil", "l")
create_custom_text_icon("water", "h2o")