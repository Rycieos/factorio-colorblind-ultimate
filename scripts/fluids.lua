require("scripts/config")
require("scripts/icons")

function get_and_shift_fluid_icons(fluid, shift, scale)
  return table.unpack(create_overlay_from_icons(icons_from_obj(data.raw.fluid[fluid]), shift, scale))
end

function overlay_fluid_barreling(fluid, proto)
  local setting = config(fluid)
  local barrel = data.raw.item[fluid .. "-barrel"]
  if setting == Options.icon then
    overlay_icon(barrel, get_and_shift_fluid_icons(fluid))
  elseif setting == Options.text_overlay then
    overlay_icon(barrel, TextOverlays[proto.text_overlay], proto.text_overlay2 and TextOverlays[proto.text_overlay2])
  else
    overlay_icon(barrel, Overlays[proto.icon_overlay], proto.icon_overlay2 and Overlays[proto.icon_overlay2])
  end

  local recipe = data.raw.recipe["fill-" .. fluid .. "-barrel"]
  -- Remove the fluid icon so we can replace it.
  table.remove(recipe.icons)
  overlay_icon(recipe, get_and_shift_fluid_icons(fluid, Offsets["upper-left"], 0.5))

  recipe = data.raw.recipe["empty-" .. fluid .. "-barrel"]
  table.remove(recipe.icons)
  overlay_icon(recipe, get_and_shift_fluid_icons(fluid, Offsets["lower-right"], 0.5))
end

function replace_solid_fuel_recipe(fluid)
  local recipe = data.raw.recipe["solid-fuel-from-" .. fluid]
  replace_icon(recipe, {
    icon = BaseIconPath .. "solid-fuel.png",
    icon_size = 64,
    icon_mipmaps = 4,
  })
  overlay_icon(recipe, get_and_shift_fluid_icons(fluid, Offsets["upper-left"], 0.5))
end
