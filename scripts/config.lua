require("scripts/utils")

function config(name)
  return settings.startup[config_name(name)].value
end

IconScale = config("scale")
