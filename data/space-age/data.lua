require("scripts.icons")
require("scripts.icon_overlays")
require("scripts.fluids")
require("scripts.updates")
require("data.base.constants")
require("data.space-age.constants")

local prototypes = require("data.space-age.prototypes")
apply_prototypes(prototypes)

-- Casting
local function do_replace_casting(item, recipe)
  if config(item .. "-icon-replacement") or config(item .. "-icon-overlay") ~= Options.none then
    replace_casting_recipe(recipe)
  end
end

do_replace_casting("copper-plate", "copper")
do_replace_casting("copper-cable", "copper-cable")
do_replace_casting("iron-plate", "iron")

if config("spores-map-color") then
  local prototype = data:get("airborne-pollutant", "spores")
  if prototype and not color_equals(config("spores-map-color"), prototype.chart_color) then
    prototype.chart_color = config("spores-map-color")
  end
end

update_resource_color("calcite")
update_resource_color("fluorine-vent")
update_resource_color("lithium-brine")
update_resource_color("scrap")
update_resource_color("sulfuric-acid-geyser")
update_resource_color("tungsten-ore")

local color = config("mining-drill-visualization-color")
if color and not color_equals(color, BaseDefaultColors["mining-drill-visualization"]) then
  update_radius_visualization_color("mining-drill", "big-mining-drill", color)
end

color = config("asteroid-collector-visualization-color")
if color and not color_equals(color, SpaceAgeDefaultColors["asteroid-collector-visualization"]) then
  update_radius_visualization_color("asteroid-collector", "asteroid-collector", color)
end

color = config("yumako-fruit-color")
if color and not color_equals(color, SpaceAgeDefaultColors["yumako-fruit"]) then
  local prototype = data:get("plant", "yumako-tree")
  if prototype then
    prototype.colors = { color }
    for _, variation in pairs(prototype.variations) do
      variation.leaves.filename = SpritePath .. "/yumako-tree/yumako-tree-harvest.png"
      variation.normal.filename = SpritePath .. "/yumako-tree/yumako-tree-normal.png"
    end
  end
end
