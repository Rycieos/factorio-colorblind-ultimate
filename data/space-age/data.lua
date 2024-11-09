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

if config("spores-color") then
  local prototype = data:get("airborne-pollutant", "spores")
  if prototype and not color_equals(config("spores-color"), prototype.chart_color) then
    prototype.chart_color = config("spores-color")
  end
end
