require("scripts/utils")

function config(name)
  local setting = settings.startup[config_name(name)]
  return setting and setting.value
end

IconScale = config("scale")
