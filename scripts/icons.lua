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

local function create_custom_signal_icon(name)
  create_custom_icon(name, "signal/" .. name)
end

local function create_custom_text_icon(name, path)
  CustomIcons[name .. "-text"] = {
    icon = IconPath .. "text/" .. path .. ".png",
    icon_size = 64,
    icon_mipmaps = 2,
    scale = 1.0,
  }
end

create_custom_icon("advanced-circuit")
create_custom_icon("copper-cable")
create_custom_icon("copper-plate")
create_custom_icon("electronic-circuit")
create_custom_icon("express-transport-belt")
create_custom_icon("fast-underground-belt")
create_custom_icon("green-wire")
create_custom_icon("transport-belt")
create_custom_icon("underground-belt")

create_custom_fluid_icon("heavy-oil")
create_custom_fluid_icon("light-oil")
create_custom_fluid_icon("water")

create_custom_text_icon("green-wire", "g")
create_custom_text_icon("heavy-oil", "h")
create_custom_text_icon("light-oil", "l")
create_custom_text_icon("red-wire", "r")
create_custom_text_icon("water", "h2o")

create_custom_signal_icon("signal-each")
create_custom_signal_icon("signal-everything")
for _, signal in pairs(SignalColors) do
  create_custom_signal_icon(signal)
end
