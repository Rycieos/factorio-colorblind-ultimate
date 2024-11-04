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

  ["metallurgic-science-pack"] = {
    type = "tool",
    icon_overlay = "tungsten-carbide",
    text_overlay = "T",
  },
  ["electromagnetic-science-pack"] = {
    type = "tool",
    icon_overlay = "holmium-solution",
    text_overlay = "E",
  },
  ["agricultural-science-pack"] = {
    type = "tool",
    icon_overlay = "bioflux",
    text_overlay = "B",
  },
  ["cryogenic-science-pack"] = {
    type = "tool",
    icon_overlay = "lithium-plate",
    text_overlay = "C",
  },
  ["promethium-science-pack"] = {
    type = "tool",
    icon_overlay = "promethium-asteroid-chunk",
    text_overlay = "P",
  },

  --florine
  --thruster-fuel
  --thruster-oxidizer
  --lava
  --holmium-solution
  --electrolyte
  --ammoniacal-solution
  --fluoroketone-hot
  --fluoroketone-cold
  --lithium-brine
  --
  --casting-iron
  --casting-copper
  --casting-copper-cable
  --advanced-thruster-fuel
  --advanced-thruster-oxidizer
}

return Prototypes
