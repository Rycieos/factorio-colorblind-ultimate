require("scripts.icons")
require("scripts.icon_overlays")
require("scripts.fluids")
require("scripts.updates")

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
