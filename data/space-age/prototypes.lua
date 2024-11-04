require("scripts.utils")

local Prototypes = {
  ["molten-copper"] = {
    type = "fluid",
    localised_name = { "fluid-name.molten-copper" },
    icon_overlay_from = { "item", "copper-plate" },
    text_overlay = "Cu",
    nested_prototypes = {
      { "recipe", "molten-copper-from-lava" },
    },
  },
  ["molten-iron"] = {
    type = "fluid",
    localised_name = { "fluid-name.molten-iron" },
    icon_overlay_from = { "item", "iron-plate" },
    text_overlay = "Fe",
    nested_prototypes = {
      { "recipe", "molten-iron-from-lava" },
    },
  },

  ["holmium-plate"] = {
    type = "item",
    icon_overlay_from = { "fluid", "holmium-solution" },
    text_overlay = "H",
  },
  ["fusion-power-cell"] = {
    type = "item",
    icon_overlay_from = { "fluid", "ammonia" },
    text_overlay = "F",
  },

  ["railgun-ammo"] = {
    type = "ammo",
    icon_overlay = "piercing",
    text_overlay = "R",
  },
}

return Prototypes
