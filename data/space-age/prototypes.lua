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
    order = "item-basic",
    icon_overlay_from = { "fluid", "holmium-solution" },
    text_overlay = "H",
  },
  ["fusion-power-cell"] = {
    type = "item",
    order = "item-advanced",
    icon_overlay_from = { "fluid", "ammonia" },
    text_overlay = "F",
  },

  ["railgun-ammo"] = {
    type = "ammo",
    icon_overlay_from = { "item", "iron-stick" },
    text_overlay = "R",
  },

  ["turbo-loader"] = {
    type = "loader",
    sprite_replacement = SpritePath .. "turbo-loader/turbo-loader-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-4",
  },
  ["turbo-splitter"] = {
    type = "splitter",
    is_entity = true,
    icon_overlay = "tier-4",
  },
  ["turbo-transport-belt"] = {
    type = "transport-belt",
    is_entity = true,
    icon_replacement = true,
    icon_overlay = "tier-4",
  },
  ["turbo-underground-belt"] = {
    type = "underground-belt",
    sprite_replacement = SpritePath .. "turbo-underground-belt/turbo-underground-belt-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-4",
  },

  ["stack-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "stack",
    text_overlay = "S",
  },

  ["space-science-pack"] = {
    type = "tool",
    config_from = "space-science-pack",
    icon_replacement = true,
    icon_overlay_from = { "item", "carbon" },
    text_overlay = "S",
    nested_prototypes = {
      { "recipe", "space-science-pack" },
    },
  },
  ["metallurgic-science-pack"] = {
    type = "tool",
    icon_overlay_from = { "item", "tungsten-carbide" },
    text_overlay = "T",
  },
  ["electromagnetic-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "fluid", "holmium-solution" },
    text_overlay = "E",
  },
  ["agricultural-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "capsule", "bioflux" },
    text_overlay = "B",
  },
  ["cryogenic-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "item", "lithium-plate" },
    text_overlay = "C",
  },
  ["promethium-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "item", "promethium-asteroid-chunk" },
    text_overlay = "P",
  },

  ["fluorine"] = {
    type = "fluid",
    localised_name = { "fluid-name.fluorine" },
    icon_overlay_from = { "resource", "fluorine-vent" },
    text_overlay = "F",
  },
  ["lithium-brine"] = {
    type = "fluid",
    localised_name = { "fluid-name.lithium-brine" },
    icon_overlay_from = { "item", "lithium" },
    text_overlay = "Li",
  },
  ["thruster-fuel"] = {
    type = "fluid",
    localised_name = { "fluid-name.thruster-fuel" },
    icon_overlay = "flame-custom",
    text_overlay = "F",
  },
  ["thruster-oxidizer"] = {
    type = "fluid",
    localised_name = { "fluid-name.thruster-oxidizer" },
    icon_overlay = "water-custom",
    text_overlay = "O",
  },
  ["electrolyte"] = {
    type = "fluid",
    localised_name = { "fluid-name.electrolyte" },
    icon_overlay_from = { "item", "supercapacitor" },
    text_overlay = "E",
  },
  ["holmium-solution"] = {
    type = "fluid",
    localised_name = { "fluid-name.holmium-solution" },
    icon_overlay_from = { "item", "holmium-ore" },
    text_overlay = "Ho",
  },
  ["lava"] = {
    type = "fluid",
    localised_name = { "fluid-name.lava" },
    icon_overlay_from = { "item", "stone" },
    text_overlay = "La",
  },
  ["ammoniacal-solution"] = {
    type = "fluid",
    localised_name = { "fluid-name.ammoniacal-solution" },
    icon_overlay_from = { "fluid", "ammonia" },
    text_overlay = "A",
  },
  ["fluoroketone-hot"] = {
    type = "fluid",
    localised_name = { "fluid-name.fluoroketone-hot" },
    icon_overlay = "flame-custom",
    text_overlay = "Fh",
  },
  ["fluoroketone-cold"] = {
    type = "fluid",
    localised_name = { "fluid-name.fluoroketone-cold" },
    icon_overlay_from = { "item", "cryogenic-plant" },
    text_overlay = "Fc",
  },
}

return Prototypes
