require("scripts.icons")
require("scripts.fluids")
require("scripts.updates")
require("scripts.utils")

local prototypes = require("data.base.prototypes")

local setting = config("filled-barrels")
if setting ~= Options.none then
  for name, fluid in pairs(data.raw.fluid) do
    if fluid.auto_barrel ~= false then
      local barrel = data:get("item", name .. "-barrel")
      if barrel then
        if setting == "fluid-icon" then
          overlay_icon(barrel, get_and_shift_fluid_icons(name))
        else
          local proto = prototypes[name]
          if proto and proto.type == "fluid" then
            local setting = config(name)
            if setting ~= Options.icon then
              do_replace_or_overlay(name .. "-barrel", table_merge(proto, { type = "item" }), name)
            end
          end
        end
      end
    end
  end
end
