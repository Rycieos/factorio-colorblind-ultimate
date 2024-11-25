require("scripts.icons")
require("scripts.fluids")
require("scripts.utils")

local setting = config("filled-barrels")
if setting ~= Options.none then
  for name, fluid in pairs(data.raw.fluid) do
    if fluid.auto_barrel ~= false then
      local barrel = data:get("item", name .. "-barrel")
      if barrel then
        if setting == "fluid-icon" then
          overlay_icon(barrel, get_and_shift_fluid_icons(name))
        else
          local icons = icons_from_obj(fluid)
          if #icons > 1 then
            table.remove(icons, 1)
            for _, icon in pairs(icons) do
              table.insert(barrel.icons, icon)
            end
          end
        end
      end
    end
  end
end
