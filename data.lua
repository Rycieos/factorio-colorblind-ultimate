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

if config("electronic-circuit-custom") then
  override_icon("electronic-circuit")
elseif config("electronic-circuit-letter") then
  icon_add_letter("electronic-circuit", "A")
end
