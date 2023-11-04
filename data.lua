local Root = "__colorblind_ultimate__"
local Icons = Root.."/graphics/icons/"

local function config(name)
  return settings.startup["colorblind_ultimate__" .. name].value
end

local function override_icon(name)
  data.raw["item"][name].icon = Icons .. name .. ".png"
end

if config "electronic-circuit" then
  override_icon "electronic-circuit"
end
