require("scripts.utils")

for mod, mod_stages in pairs(Mods) do
  if mods[mod] and mod_stages.updates then
    require("data." .. mod .. ".data-updates")
  end
end
