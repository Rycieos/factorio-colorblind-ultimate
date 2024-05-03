require("scripts.utils")

require("data.core.data-updates")

for _, mod in ipairs(Mods) do
  if mods[mod] then
    require("data." .. mod .. ".data-updates")
  end
end
