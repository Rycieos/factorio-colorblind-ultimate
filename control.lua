-- Redraw map to get updated colors.
local rechart = function(_)
  game.forces.player.rechart()
end

script.on_init(rechart)
script.on_configuration_changed(rechart)

require("scripts.utils")

for mod, mod_stages in pairs(Mods) do
  if script.active_mods[mod] and mod_stages.control then
    require("data." .. mod .. ".control")
  end
end
