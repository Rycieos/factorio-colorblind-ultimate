require("scripts.config")
require("scripts.utils")
require("data.core.constants")

-- Run the func if the setting by the name is changed from the default.
---@param name string
---@param func fun(color: Color)
function do_if_color_setting(name, func)
  local setting = config(name .. "-color") --[[@as Color|false]]
  if setting and not color_equals(setting, DefaultColors[name]) then
    func(setting)
  end
end
