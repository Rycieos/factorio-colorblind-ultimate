require("scripts/config")
require("scripts/icons")

function get_and_shift_fluid_icons(fluid, shift, scale)
  return table.unpack(create_overlay_from_icons(icons_from_obj(data.raw.fluid[fluid]), shift, scale))
end

function replace_solid_fuel_recipe(fluid)
  local recipe = data:get("recipe", "solid-fuel-from-" .. fluid)
  if recipe then
    replace_icons(recipe, icons_from_obj(data:get(recipe.results[1].type, recipe.results[1].name)))
    overlay_icon(recipe, get_and_shift_fluid_icons(fluid, Offsets["upper-left"], 0.5))
  end
end

function replace_casting_recipe(result)
  local recipe = data:get("recipe", "casting-" .. result)
  if recipe then
    replace_icon(recipe, EmptyIcon)
    overlay_icon(
      recipe,
      unpack(
        create_overlay_from_icons(
          icons_from_obj(data:get(recipe.results[1].type, recipe.results[1].name)),
          { -5, 6 },
          0.8
        )
      )
    )
    overlay_icon(
      recipe,
      unpack(
        create_overlay_from_icons(
          icons_from_obj(data:get(recipe.ingredients[1].type, recipe.ingredients[1].name)),
          { 5, -4 },
          0.8
        )
      )
    )
  end
end
