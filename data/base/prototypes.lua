require("scripts/utils")

local Prototypes = {
  ["copper-cable"] = {
    type = "item",
    order = "item-wire",
    icon_replacement = true,
    text_overlay = "Cu",
  },
  ["copper-plate"] = {
    type = "item",
    order = "item-basic",
    icon_replacement = true,
    text_overlay = "Cu",
  },
  ["iron-plate"] = {
    type = "item",
    order = "item-basic",
    text_overlay = "Fe",
  },
  ["stone-brick"] = {
    type = "item",
    order = "item-basic",
    icon_overlay_from = { "simple-entity", "big-rock" },
    text_overlay = "S",
  },

  ["signal-each"] = {
    type = "virtual-signal",
    icon_replacement = "signal/",
    localised_name = { "", { "virtual-signal-name.signal-each" }, " ", { "item-group-name.signals" } },
  },
  ["signal-everything"] = {
    type = "virtual-signal",
    icon_replacement = "signal/",
    localised_name = { "", { "virtual-signal-name.signal-everything" }, " ", { "item-group-name.signals" } },
  },

  ["electronic-circuit"] = {
    type = "item",
    order = "item-circuit1",
    icon_replacement = true,
    icon_overlay = "tier-1",
    text_overlay = "E",
  },
  ["advanced-circuit"] = {
    type = "item",
    order = "item-circuit2",
    icon_replacement = true,
    icon_overlay = "tier-2",
    text_overlay = "A",
  },
  ["processing-unit"] = {
    type = "item",
    order = "item-circuit3",
    icon_overlay = "tier-3",
    text_overlay = "P",
  },

  ["green-wire"] = {
    type = "item",
    order = "item-wire",
    icon_replacement = true,
    text_overlay = "G",
  },
  ["red-wire"] = {
    type = "item",
    order = "item-wire",
    text_overlay = "R",
  },

  ["assembling-machine-1"] = {
    type = "assembling-machine",
    is_entity = true,
    icon_overlay = "tier-1",
  },
  ["assembling-machine-2"] = {
    type = "assembling-machine",
    is_entity = true,
    icon_overlay = "tier-2",
  },
  ["assembling-machine-3"] = {
    type = "assembling-machine",
    is_entity = true,
    icon_overlay = "tier-3",
  },
  ["loader"] = {
    type = "loader",
    is_entity = true,
    icon_overlay = "tier-1",
  },
  ["fast-loader"] = {
    type = "loader",
    sprite_replacement = SpritePath .. "fast-loader/fast-loader-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-2",
  },
  ["express-loader"] = {
    type = "loader",
    sprite_replacement = SpritePath .. "express-loader/express-loader-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-3",
  },
  ["splitter"] = {
    type = "splitter",
    is_entity = true,
    icon_overlay = "tier-1",
  },
  ["fast-splitter"] = {
    type = "splitter",
    is_entity = true,
    icon_overlay = "tier-2",
  },
  ["express-splitter"] = {
    type = "splitter",
    is_entity = true,
    icon_overlay = "tier-3",
  },
  ["transport-belt"] = {
    type = "transport-belt",
    is_entity = true,
    icon_replacement = true,
    icon_overlay = "tier-1",
  },
  ["fast-transport-belt"] = {
    type = "transport-belt",
    is_entity = true,
    icon_overlay = "tier-2",
  },
  ["express-transport-belt"] = {
    type = "transport-belt",
    is_entity = true,
    icon_replacement = true,
    icon_overlay = "tier-3",
  },
  ["underground-belt"] = {
    type = "underground-belt",
    sprite_replacement = SpritePath .. "underground-belt/underground-belt-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-1",
  },
  ["fast-underground-belt"] = {
    type = "underground-belt",
    sprite_replacement = SpritePath .. "fast-underground-belt/fast-underground-belt-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-2",
  },
  ["express-underground-belt"] = {
    type = "underground-belt",
    is_entity = true,
    icon_overlay = "tier-3",
  },

  ["blueprint"] = {
    type = "blueprint",
    order = "planner",
    icon_overlay_from = { "shortcut", "give-blueprint", { 0, 0 }, 1 },
    text_overlay = "B",
  },
  ["deconstruction-planner"] = {
    type = "deconstruction-item",
    order = "planner",
    icon_overlay_from = { "shortcut", "give-deconstruction-planner", { 0, 0 }, 1 },
    text_overlay = "D",
  },
  ["upgrade-planner"] = {
    type = "upgrade-item",
    order = "planner",
    icon_overlay_from = { "shortcut", "give-upgrade-planner", { 0, 0 }, 1 },
    text_overlay = "U",
  },

  ["nuclear-fuel"] = {
    type = "item",
    order = "item-nuclear",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },
  ["uranium-235"] = {
    type = "item",
    order = "item-nuclear",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },
  ["uranium-fuel-cell"] = {
    type = "item",
    order = "item-nuclear",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },
  ["uranium-cannon-shell"] = {
    type = "ammo",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },
  ["uranium-rounds-magazine"] = {
    type = "ammo",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },
  ["atomic-bomb"] = {
    type = "ammo",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },

  ["explosive-cannon-shell"] = {
    type = "ammo",
    icon_overlay = "explosives",
    text_overlay = "Ex",
  },
  ["explosive-rocket"] = {
    type = "ammo",
    icon_overlay = "explosives",
    text_overlay = "Ex",
  },
  ["cluster-grenade"] = {
    type = "capsule",
    icon_overlay = "explosives",
    text_overlay = "Ex",
  },

  ["explosive-uranium-cannon-shell"] = {
    type = "ammo",
    icon_overlay = "nuclear",
    icon_overlay2 = "explosives",
    text_overlay = "ExU",
  },

  ["cliff-explosives"] = {
    type = "capsule",
    icon_overlay_from = { "cliff", "cliff" },
    text_overlay = "C",
  },

  ["piercing-rounds-magazine"] = {
    type = "ammo",
    icon_overlay_from = { "item", "iron-stick" },
    text_overlay = "P",
  },
  ["piercing-shotgun-shell"] = {
    type = "ammo",
    icon_overlay_from = { "item", "iron-stick" },
    text_overlay = "P",
  },

  ["slowdown-capsule"] = {
    type = "capsule",
    icon_overlay = "speed",
    text_overlay = "S",
  },

  ["efficiency-module"] = {
    type = "module",
    icon_overlay = "efficiency",
    text_overlay = "E",
    nested_prototypes = {
      { "module", "efficiency-module-2" },
      { "module", "efficiency-module-3" },
    },
  },
  ["productivity-module"] = {
    type = "module",
    icon_overlay = "productivity",
    text_overlay = "P",
    nested_prototypes = {
      { "module", "productivity-module-2" },
      { "module", "productivity-module-3" },
    },
  },
  ["speed-module"] = {
    type = "module",
    icon_overlay = "speed-constant",
    text_overlay = "S",
    nested_prototypes = {
      { "module", "speed-module-2" },
      { "module", "speed-module-3" },
    },
  },

  ["active-provider-chest"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "pushes",
    text_overlay = "A",
  },
  ["passive-provider-chest"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "output",
    text_overlay = "P",
  },
  ["buffer-chest"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "buffer",
    text_overlay = "B",
  },
  ["requester-chest"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "input",
    text_overlay = "R",
  },
  ["storage-chest"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "stack",
    text_overlay = "S",
  },

  ["automation-science-pack"] = {
    type = "tool",
    icon_overlay_from = { "item", "iron-gear-wheel" },
    text_overlay = "A",
  },
  ["logistic-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "item", "inserter" },
    text_overlay = "L",
  },
  ["military-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "ammo", "piercing-rounds-magazine" },
    text_overlay = "M",
  },
  ["chemical-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "fluid", "sulfuric-acid" },
    text_overlay = "Ch",
  },
  ["production-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "module", "productivity-module" },
    text_overlay = "Pd",
  },
  ["utility-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "item", "processing-unit" },
    text_overlay = "U",
  },
  ["space-science-pack"] = {
    type = "tool",
    icon_replacement = true,
    icon_overlay_from = { "item", "satellite" },
    text_overlay = "S",
    nested_prototypes = {
      { "recipe", "space-science-pack" },
    },
  },

  ["burner-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "fire",
    text_overlay = "Bn",
  },
  ["fast-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "speed",
    text_overlay = "Fa",
  },
  ["long-handed-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "pushes",
    text_overlay = "LH",
  },
  ["bulk-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "plus",
    text_overlay = "B",
  },

  ["coal"] = {
    type = "item",
    order = "item-resource",
    icon_overlay = "fire",
    text_overlay = "C",
  },
  ["copper-ore"] = {
    type = "item",
    order = "item-resource",
    icon_overlay_from = { "item", "copper-plate" },
    text_overlay = "Cu",
  },
  ["iron-ore"] = {
    type = "item",
    order = "item-resource",
    icon_overlay_from = { "item", "iron-plate" },
    text_overlay = "Fe",
  },
  ["stone"] = {
    type = "item",
    order = "item-resource",
    icon_overlay_from = { "item", "stone-brick" },
    text_overlay = "S",
  },
  ["uranium-ore"] = {
    type = "item",
    order = "item-resource",
    icon_overlay_from = { "item", "uranium-238" },
    text_overlay = "U",
  },

  ["crude-oil"] = {
    type = "fluid",
    localised_name = { "fluid-name.crude-oil" },
    icon_overlay_from = { "item", "pumpjack" },
    text_overlay = "C",
  },
  ["lubricant"] = {
    type = "fluid",
    localised_name = { "fluid-name.lubricant" },
    icon_overlay_from = { "item", "iron-gear-wheel" },
    text_overlay = "Lu",
  },
  ["heavy-oil"] = {
    type = "fluid",
    localised_name = { "fluid-name.heavy-oil" },
    icon_replacement = "fluid/",
    text_overlay = "H",
    hooks = {
      replace_solid_fuel_recipe,
    },
  },
  ["light-oil"] = {
    type = "fluid",
    localised_name = { "fluid-name.light-oil" },
    icon_replacement = "fluid/",
    text_overlay = "L",
    hooks = {
      replace_solid_fuel_recipe,
    },
  },
  ["petroleum-gas"] = {
    type = "fluid",
    localised_name = { "fluid-name.petroleum-gas" },
    text_overlay = "P",
    hooks = {
      replace_solid_fuel_recipe,
    },
  },
  ["sulfuric-acid"] = {
    type = "fluid",
    localised_name = { "fluid-name.sulfuric-acid" },
    text_overlay = "S",
  },
  ["water"] = {
    type = "fluid",
    localised_name = { "fluid-name.water" },
    icon_replacement = "fluid/",
    icon_overlay = "water-custom",
    text_overlay = "H2O",
  },
}

return Prototypes
