-- Redraw map to get updated colors.
local rechart = function(_)
  game.forces.player.rechart()
end

script.on_init(rechart)
script.on_configuration_changed(rechart)
