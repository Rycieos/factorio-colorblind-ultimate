require("scripts.config")
require("scripts.utils")
require("data.core.constants")

function do_if_color_setting(name, func)
  local setting = config(name .. "-color")
  if setting and not color_equals(setting, DefaultColors[name]) then
    func(setting)
  end
end
