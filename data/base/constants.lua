require("data.core.constants")

SignalColors = {
  "signal-black",
  "signal-blue",
  "signal-cyan",
  "signal-green",
  "signal-grey",
  "signal-pink",
  "signal-red",
  "signal-white",
  "signal-yellow",
}

local BaseDefaultColors = {
  -- Source: __base__/graphics/entity/beacon/beacon-radius-visualization.png
  ["beacon-visualization"] = { r = 217, g = 192, b = 55, a = 255 },
  -- Source: __base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png
  ["electric-pole-visualization"] = { r = 55, g = 85, b = 217, a = 255 },
  -- Source: __base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png
  ["mining-drill-visualization"] = { r = 78, g = 173, b = 159, a = 255 },
  -- Source: __base__/prototypes/entity/enemy-constants.lua
  ["acid-stream"] = { 0.917, 1.000, 0.282, 1.000 },
  ["acid-splash"] = { 1.000, 0.992, 0.512, 1.000 },
  ["acid-sticker"] = { r = 0.714, g = 0.669, b = 0.291, a = 0.745 },
  biter_spawner = { 0.92, 0.54, 0, 0.5 },
  spitter_spawner = { 0.99, 0.09, 0.09, 1 },
}
DefaultColors = table_merge(DefaultColors, BaseDefaultColors)
