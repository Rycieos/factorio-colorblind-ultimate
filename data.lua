require("scripts.utils")

require("data.core.data")

for mod, mod_stages in pairs(Mods) do
  if mods[mod] and mod_stages.data then
    require("data." .. mod .. ".data")
  end
end
