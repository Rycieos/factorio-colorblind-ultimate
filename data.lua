local Root = "__colorblind_ultimate__"
local Icons = Root.."/graphics/icons/"

local function config(name)
  return settings.startup["colorblind_ultimate__" .. name].value
end

local function override_icon(name)
  data.raw["item"][name].icon = Icons .. name .. ".png"
end

local function icon_add_letter(name, letter)
  data.raw["item"][name].icons = {
    {
      icon = '__base__/graphics/icons/' .. name .. '.png',
      icon_size = 64,
      icon_mipmaps = 4,
    },
    {
      icon = Icons .. letter .. '.png',
      icon_size = 64,
      icon_mipmaps = 4,
      scale = 0.3,
      shift = {7, 7},
    },
  }
end

local function overlay_icon(_type, item, icon)
  data.raw[_type][item].icons = {
    {
      icon = data.raw[_type][item].icon,
      icon_size = 64,
      icon_mipmaps = 4,
    }, {
      icon = icon,
      icon_size = 32,
      icon_mipmaps = 2,
    },
  }
end

if config("electronic-circuit-custom") then
  override_icon("electronic-circuit")
elseif config("electronic-circuit-letter") then
  icon_add_letter("electronic-circuit", "A")
end

overlay_icon("blueprint", "blueprint", "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-x32-white.png")
overlay_icon("deconstruction-item", "deconstruction-planner", "__base__/graphics/icons/shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png")
overlay_icon("upgrade-item", "upgrade-planner", "__base__/graphics/icons/shortcut-toolbar/mip/new-upgrade-planner-x32-white.png")
