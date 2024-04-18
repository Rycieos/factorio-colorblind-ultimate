require("scripts/config")
require("scripts/icons")

function get_and_shift_fluid_icons(fluid, shift, scale)
  return table.unpack(create_overlay_from_icons(
    icons_from_obj(data.raw["fluid"][fluid]),
    shift,
    scale
  ))
end

function overlay_fluid_barreling(fluid)
  local recipe = "fill-" .. fluid .. "-barrel"
  -- Remove the fluid icon so we can replace it.
  table.remove(data.raw["recipe"][recipe].icons)
  overlay_icon("recipe", recipe, get_and_shift_fluid_icons(fluid, {-8, -8}, 0.5))

  recipe = "empty-" .. fluid .. "-barrel"
  table.remove(data.raw["recipe"][recipe].icons)
  overlay_icon("recipe", recipe, get_and_shift_fluid_icons(fluid, {8, 8}, 0.5))
end

function overlay_or_replace_fluid(fluid)
  local setting = config(fluid .. "-custom")
  if setting ~= "none" then
    local overlay
    if setting == "text-overlay" then
      overlay = Overlays[fluid .. "-text-custom"]
    else
      overlay = Overlays[fluid .. "-custom"]
    end
    overlay_icon("item", fluid .. "-barrel", overlay)

    if setting == "molecule" then
      replace_icon("fluid", fluid, CustomIcons[fluid])
    else
      overlay_icon("fluid", fluid, overlay)
    end

    if fluid == "heavy-oil" or fluid == "light-oil" then
      local recipe = "solid-fuel-from-" .. fluid
      replace_icon("recipe", recipe, {
        icon = BaseIconPath .. "solid-fuel.png",
        icon_size = 64,
        icon_mipmaps = 4,
      })
      overlay_icon("recipe", recipe, get_and_shift_fluid_icons(fluid, {-8, -8}, 0.5))
    end

    overlay_fluid_barreling(fluid)
  end
end
