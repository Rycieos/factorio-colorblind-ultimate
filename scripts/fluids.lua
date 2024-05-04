require("scripts/config")
require("scripts/icons")

function get_and_shift_fluid_icons(fluid, shift, scale)
  return table.unpack(create_overlay_from_icons(icons_from_obj(data.raw.fluid[fluid]), shift, scale))
end

function replace_solid_fuel_recipe(fluid)
  local recipe = data:get("recipe", "solid-fuel-from-" .. fluid)
  if recipe then
    replace_icon(recipe, {
      icon = BaseIconPath .. "solid-fuel.png",
      icon_size = 64,
      icon_mipmaps = 4,
    })
    overlay_icon(recipe, get_and_shift_fluid_icons(fluid, Offsets["upper-left"], 0.5))
  end
end
