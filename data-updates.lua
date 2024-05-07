require("scripts.utils")

require("data.core.data-updates")

for mod, mod_stages in pairs(Mods) do
  if mods[mod] and mod_stages.updates then
    require("data." .. mod .. ".data-updates")
  end
end
