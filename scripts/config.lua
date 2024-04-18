require("scripts/utils")

function config_name(name)
  return Mod .. "__" .. name
end

function config(name)
  return settings.startup[config_name(name)].value
end

IconScale = config("scale")
