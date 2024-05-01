require("scripts/utils")

SpritePath = ModPath .. "/graphics/entity/"

local function remove_overlay(name, proto)
  if config(name) == Options.icon_overlay then
    table.remove(data.raw[proto.type][name].icons)
  end
end

-- <Prototype>:
-- Fields:
-- <key>: <string> Factorio prototype name.
-- type: <string> Factorio prototype type. Required.
-- localised_name: <LocalisedString>: Defaults to {"<is_entity and "entity" or "item">-name.<name>"}.
-- is_entity: <bool>: Defaults to (bool)sprite_replacement.
-- sprite_replacement: <FileName>
-- hr_sprite_replacement: <FileName>
-- icon_replacement: <bool|string>
-- icon_overlay: <string>
-- icon_overlay2 <string>
-- icon_overlay_from: Array<string>: prototype to copy icon from as an overlay.
-- text_overlay: <string>
-- text_overlay2 <string>
-- nested_prototypes: Array<Array<string>>: prototype {type, name}s that should
--   be modified if the base prototype is enabled.
-- hooks: Array<function>
local Prototypes = {
  ["copper-cable"] = {
    type = "item",
    icon_replacement = true,
    text_overlay = "Cu",
  },
  ["copper-plate"] = {
    type = "item",
    icon_replacement = true,
    text_overlay = "Cu",
  },
  ["iron-plate"] = {
    type = "item",
    text_overlay = "Fe",
  },
  ["stone-brick"] = {
    type = "item",
    icon_overlay = "rock-big",
    text_overlay = "S",
  },

  ["signal-each"] = {
    type = "virtual-signal",
    icon_replacement = "signal/",
    localised_name = {"", {"virtual-signal-name.signal-each"}, " ", {"item-group-name.signals"}},
  },
  ["signal-everything"] = {
    type = "virtual-signal",
    icon_replacement = "signal/",
    localised_name = {"", {"virtual-signal-name.signal-everything"}, " ", {"item-group-name.signals"}},
  },

  ["electronic-circuit"] = {
    type = "item",
    icon_replacement = true,
    icon_overlay = "tier-1",
    text_overlay = "E",
  },
  ["advanced-circuit"] = {
    type = "item",
    icon_replacement = true,
    icon_overlay = "tier-2",
    text_overlay = "A",
  },
  ["processing-unit"] = {
    type = "item",
    icon_overlay = "tier-3",
    text_overlay = "P",
  },

  ["green-wire"] = {
    type = "item",
    icon_replacement = true,
    text_overlay = "G",
  },
  ["red-wire"] = {
    type = "item",
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
    hr_sprite_replacement = SpritePath .. "underground-belt/hr-underground-belt-structure.png",
    icon_replacement = true,
    icon_overlay = "tier-1",
  },
  ["fast-underground-belt"] = {
    type = "underground-belt",
    sprite_replacement = SpritePath .. "fast-underground-belt/fast-underground-belt-structure.png",
    hr_sprite_replacement = SpritePath .. "fast-underground-belt/hr-fast-underground-belt-structure.png",
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
    icon_overlay = "blueprint",
    text_overlay = "B",
  },
  ["deconstruction-planner"] = {
    type = "deconstruction-item",
    icon_overlay = "deconstruction-planner",
    text_overlay = "D",
  },
  ["upgrade-planner"] = {
    type = "upgrade-item",
    icon_overlay = "upgrade-planner",
    text_overlay = "U",
  },

  ["nuclear-fuel"] = {
    type = "item",
    icon_overlay = "nuclear",
    text_overlay = "U",
    -- The only simple recipe in the game that has a separate icon.
    nested_prototypes = {
      {"recipe", "nuclear-fuel"},
    },
  },
  ["uranium-235"] = {
    type = "item",
    icon_overlay = "nuclear",
    text_overlay = "U",
  },
  ["uranium-fuel-cell"] = {
    type = "item",
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
    text_overlay = "U",
    text_overlay2 = "Ex",
  },

  ["cliff-explosives"] = {
    type = "capsule",
    icon_overlay = "cliff",
    text_overlay = "C",
  },

  ["piercing-rounds-magazine"] = {
    type = "ammo",
    icon_overlay = "piercing",
    text_overlay = "P",
  },
  ["piercing-shotgun-shell"] = {
    type = "ammo",
    icon_overlay = "piercing",
    text_overlay = "P",
  },

  ["slowdown-capsule"] = {
    type = "capsule",
    icon_overlay = "speed",
    text_overlay = "S",
  },

  ["effectivity-module"] = {
    type = "module",
    icon_overlay = "effectivity",
    text_overlay = "E",
    nested_prototypes = {
      {"module", "effectivity-module-2"},
      {"module", "effectivity-module-3"},
    },
  },
  ["productivity-module"] = {
    type = "module",
    icon_overlay = "productivity",
    text_overlay = "P",
    nested_prototypes = {
      {"module", "productivity-module-2"},
      {"module", "productivity-module-3"},
    },
  },
  ["speed-module"] = {
    type = "module",
    icon_overlay = "speed",
    text_overlay = "S",
    nested_prototypes = {
      {"module", "speed-module-2"},
      {"module", "speed-module-3"},
    },
  },

  ["logistic-chest-active-provider"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "pushes",
    text_overlay = "A",
  },
  ["logistic-chest-passive-provider"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "generates",
    text_overlay = "P",
  },
  ["logistic-chest-buffer"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "buffer",
    text_overlay = "B",
  },
  ["logistic-chest-requester"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "consumes",
    text_overlay = "R",
  },
  ["logistic-chest-storage"] = {
    type = "logistic-container",
    is_entity = true,
    icon_overlay = "storage",
    text_overlay = "S",
  },

  ["automation-science-pack"] = {
    type = "tool",
    icon_overlay = "iron-gear-wheel",
    text_overlay = "A",
  },
  ["logistic-science-pack"] = {
    type = "tool",
    icon_overlay = "inserter",
    text_overlay = "L",
  },
  ["military-science-pack"] = {
    type = "tool",
    icon_overlay = "piercing-rounds-magazine",
    text_overlay = "M",
  },
  ["chemical-science-pack"] = {
    type = "tool",
    icon_overlay = "sulfuric-acid",
    text_overlay = "C",
  },
  ["production-science-pack"] = {
    type = "tool",
    icon_overlay = "productivity-module",
    text_overlay = "P",
  },
  ["utility-science-pack"] = {
    type = "tool",
    icon_overlay = "processing-unit",
    text_overlay = "U",
  },
  ["space-science-pack"] = {
    type = "tool",
    icon_overlay = "satellite",
    text_overlay = "S",
  },

  ["burner-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "flame-custom",
    text_overlay = "B",
  },
  ["fast-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "speed",
    text_overlay = "Fa",
  },
  ["filter-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "filter",
    text_overlay = "Fi",
  },
  ["long-handed-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "pushes",
    text_overlay = "LH",
  },
  ["stack-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "storage",
    text_overlay = "S",
  },
  ["stack-filter-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "storage",
    icon_overlay2 = "filter",
    text_overlay = "SF",
  },

  ["coal"] = {
    type = "item",
    icon_overlay = "flame-custom",
    text_overlay = "C",
  },
  ["copper-ore"] = {
    type = "item",
    icon_overlay_from = {"item", "copper-plate"},
    text_overlay = "Cu",
  },
  ["iron-ore"] = {
    type = "item",
    icon_overlay_from = {"item", "iron-plate"},
    text_overlay = "Fe",
  },
  ["stone"] = {
    type = "item",
    icon_overlay_from = {"item", "stone-brick"},
    text_overlay = "S",
  },
  ["uranium-ore"] = {
    type = "item",
    icon_overlay = "uranium",
    text_overlay = "U",
  },

  ["crude-oil"] = {
    type = "fluid",
    localised_name = {"fluid-name.crude-oil"},
    icon_overlay = "pumpjack",
    text_overlay = "C",
    hooks = {
      overlay_fluid_barreling,
    },
  },
  ["lubricant"] = {
    type = "fluid",
    localised_name = {"fluid-name.lubricant"},
    icon_overlay = "iron-gear-wheel",
    text_overlay = "Lu",
    hooks = {
      overlay_fluid_barreling,
    },
  },
  ["heavy-oil"] = {
    type = "fluid",
    localised_name = {"fluid-name.heavy-oil"},
    icon_replacement = "fluid/",
    text_overlay = "H",
    hooks = {
      overlay_fluid_barreling,
      replace_solid_fuel_recipe,
    },
  },
  ["light-oil"] = {
    type = "fluid",
    localised_name = {"fluid-name.light-oil"},
    icon_replacement = "fluid/",
    text_overlay = "L",
    hooks = {
      overlay_fluid_barreling,
      replace_solid_fuel_recipe,
    },
  },
  ["petroleum-gas"] = {
    type = "fluid",
    localised_name = {"fluid-name.petroleum-gas"},
    icon_overlay = "petroleum-gas",
    text_overlay = "P",
    hooks = {
      remove_overlay,  -- need the overlay to apply to barrels, but not the fluid.
      overlay_fluid_barreling,
      replace_solid_fuel_recipe,
    },
  },
  ["sulfuric-acid"] = {
    type = "fluid",
    localised_name = {"fluid-name.sulfuric-acid"},
    icon_overlay = "sulfuric-acid",
    text_overlay = "S",
    hooks = {
      remove_overlay,
      overlay_fluid_barreling,
    },
  },
  ["water"] = {
    type = "fluid",
    localised_name = {"fluid-name.water"},
    icon_replacement = "fluid/",
    icon_overlay = "water-custom",
    text_overlay = "H2O",
    hooks = {
      overlay_fluid_barreling,
    },
  },
}

return Prototypes
