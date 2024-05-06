require("scripts.config")
require("scripts.updates")
require("scripts.utils")

local prototypes = require("data.Ultracube.prototypes")
apply_prototypes(prototypes)

-- Fluid recipes
if prototypes["cube-gelatinous-tar"].enabled or config("coal") ~= Options.none then
  local recipe = data:get("recipe", "cube-improved-gelatinous-tar")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.fluid["cube-gelatinous-tar"]),
        icons_from_obj(data.raw.item["coal"]),
        { shift = Offsets["upper-right"], scale = 0.5 }
      )
    )
  end
end

if prototypes["cube-gelatinous-tar"].enabled or prototypes["cube-heavy-tar"].enabled then
  local recipe = data:get("recipe", "cube-heavy-tar-reclamation")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.fluid["cube-gelatinous-tar"]),
        icons_from_obj(data.raw.fluid["cube-heavy-tar"]),
        { shift = Offsets["upper-right"], scale = 0.5 }
      )
    )
  end
end

if prototypes["cube-gelatinous-tar"].enabled or prototypes["cube-light-tar"].enabled then
  local recipe = data:get("recipe", "cube-light-tar-reclamation")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.fluid["cube-gelatinous-tar"]),
        icons_from_obj(data.raw.fluid["cube-light-tar"]),
        { shift = Offsets["upper-right"], scale = 0.5 }
      )
    )
  end
end

if
  prototypes["cube-gelatinous-tar"].enabled
  or prototypes["cube-heavy-tar"].enabled
  or prototypes["cube-light-tar"].enabled
then
  local recipe = data:get("recipe", "cube-tar-processing")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        util.combine_icons(
          icons_from_obj(data.raw.fluid["cube-gelatinous-tar"]),
          icons_from_obj(data.raw.fluid["cube-heavy-tar"]),
          { shift = { -8, 4 }, scale = 0.75 }
        ),
        icons_from_obj(data.raw.fluid["cube-light-tar"]),
        { shift = { 8, 4 }, scale = 0.75 }
      )
    )
  end
end

if prototypes["cube-deep-solution"].enabled or prototypes["cube-mineral-water"].enabled then
  local recipe = data:get("recipe", "cube-deep-crystal-distillation")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.fluid["cube-deep-solution"]),
        icons_from_obj(data.raw.fluid["cube-mineral-water"]),
        { shift = Offsets["upper-right"], scale = 0.5 }
      )
    )
  end
end

if prototypes["cube-matter-replication-gel"].enabled then
  local matter_replication_gel_icons = icons_from_obj(data.raw.fluid["cube-matter-replication-gel"])
  local recipe = data:get("recipe", "cube-basic-matter-unit-1")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.item["cube-basic-matter-unit"]),
        matter_replication_gel_icons,
        { shift = Offsets["upper-right"], scale = 0.5 }
      )
    )
  end

  local recipe = data:get("recipe", "cube-basic-contemplation-unit-1")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.tool["cube-basic-contemplation-unit"]),
        matter_replication_gel_icons,
        { shift = Offsets["lower-right"], scale = 0.5 }
      )
    )
  end

  local recipe = data:get("recipe", "cube-n-dimensional-widget-1")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.item["cube-n-dimensional-widget"]),
        matter_replication_gel_icons,
        { shift = Offsets["lower-right"], scale = 0.5 }
      )
    )
  end
end

if prototypes["cube-mineral-water"].enabled then
  local recipe = data:get("recipe", "cube-deep-powder-separation")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.item["cube-deep-powder"]),
        icons_from_obj(data.raw.fluid["cube-mineral-water"]),
        { shift = Offsets["upper"], scale = 0.5 }
      )
    )
  end
end

if config("water") ~= Options.none then
  local recipe = data:get("recipe", "cube-sand-dilution")
  if recipe then
    replace_icons(
      recipe,
      util.combine_icons(
        icons_from_obj(data.raw.item["cube-sand"]),
        icons_from_obj(data.raw.fluid["water"]),
        { shift = Offsets["upper"], scale = 0.5 }
      )
    )
  end
end
