require("scripts/config")
require("scripts/icons")

function get_and_shift_fluid_icons(fluid, shift, scale)
  return table.unpack(create_overlay_from_icons(
    icons_from_obj(data.raw.fluid[fluid]),
    shift,
    scale
  ))
end

function overlay_fluid_barreling(fluid)
  local recipe = data.raw.recipe["fill-" .. fluid .. "-barrel"]
  -- Remove the fluid icon so we can replace it.
  table.remove(recipe.icons)
  overlay_icon(recipe, get_and_shift_fluid_icons(fluid, {-8, -8}, 0.5))

  recipe = data.raw.recipe["empty-" .. fluid .. "-barrel"]
  table.remove(recipe.icons)
  overlay_icon(recipe, get_and_shift_fluid_icons(fluid, {8, 8}, 0.5))
end

function overlay_or_replace_fluid(fluid)
  local setting = config(fluid)
  if setting ~= Options.none then
    local overlay
    if setting == Options.text_overlay then
      overlay = Overlays[fluid .. "-text-custom"]
    else
      overlay = Overlays[fluid .. "-custom"]
    end
    overlay_icon(data.raw.item[fluid .. "-barrel"], overlay)

    if setting == Options.icon then
      replace_icon(data.raw.fluid[fluid], CustomIcons[fluid])
    else
      overlay_icon(data.raw.fluid[fluid], overlay)
    end

    if fluid == "heavy-oil" or fluid == "light-oil" then
      local recipe = data.raw.recipe["solid-fuel-from-" .. fluid]
      replace_icon(recipe, {
        icon = BaseIconPath .. "solid-fuel.png",
        icon_size = 64,
        icon_mipmaps = 4,
      })
      overlay_icon(recipe, get_and_shift_fluid_icons(fluid, {-8, -8}, 0.5))
    end

    overlay_fluid_barreling(fluid)
    return true
  end
  return false
end
