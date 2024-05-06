require("scripts/utils")

local BasePrototypes = require("data.base.prototypes")

local Prototypes = {
  ["cube-advanced-circuit"] = table_merge(BasePrototypes["advanced-circuit"], {
    config_from = "advanced-circuit",
  }),
  ["cube-electronic-circuit"] = table_merge(BasePrototypes["electronic-circuit"], {
    config_from = "electronic-circuit",
  }),
  ["cube-nuclear-fuel"] = table_merge(BasePrototypes["nuclear-fuel"], {
    config_from = "nuclear-fuel",
    nested_prototypes = {},
  }),
  ["cube-efficiency-module"] = table_merge(BasePrototypes["effectivity-module"], {
    config_from = "effectivity-module",
    nested_prototypes = {
      { "module", "cube-efficiency-module-v2" },
      { "module", "cube-efficiency-module-v3" },
    },
  }),
  ["cube-productivity-module"] = table_merge(BasePrototypes["productivity-module"], {
    config_from = "productivity-module",
    nested_prototypes = {
      { "module", "cube-productivity-module-v2" },
      { "module", "cube-productivity-module-v3" },
    },
  }),
  ["cube-speed-module"] = table_merge(BasePrototypes["speed-module"], {
    config_from = "speed-module",
    nested_prototypes = {
      { "module", "cube-speed-module-v2" },
      { "module", "cube-speed-module-v3" },
    },
  }),

  ["cube-electric-mining-drill"] = {
    type = "mining-drill",
    is_entity = true,
    icon_overlay = "tier-1",
  },
  ["cube-electric-mining-drill-mk2"] = {
    type = "mining-drill",
    is_entity = true,
    icon_overlay = "tier-2",
  },

  ["cube-v4-transport-belt"] = {
    type = "transport-belt",
    is_entity = true,
    icon_overlay = "tier-4",
  },
  ["cube-v4-underground-belt"] = {
    type = "underground-belt",
    is_entity = true,
    icon_overlay = "tier-4",
  },
  ["cube-v4-splitter"] = {
    type = "splitter",
    is_entity = true,
    icon_overlay = "tier-4",
  },

  ["aai-loader"] = {
    type = "loader-1x1",
    is_entity = true,
    icon_overlay = "tier-1",
  },
  ["aai-v2-loader"] = {
    type = "loader-1x1",
    is_entity = true,
    icon_overlay = "tier-2",
  },
  ["aai-v3-loader"] = {
    type = "loader-1x1",
    is_entity = true,
    icon_overlay = "tier-3",
  },
  ["aai-v4-loader"] = {
    type = "loader-1x1",
    is_entity = true,
    icon_overlay = "tier-4",
  },

  ["cube-extremely-long-inserter"] = {
    type = "inserter",
    is_entity = true,
    icon_overlay = "filter",
    icon_overlay2 = "pushes",
    text_overlay = "Ex",
  },

  ["cube-uranium-234"] = BasePrototypes["uranium-235"],

  ["cube-calcium"] = {
    type = "item",
    text_overlay = "C",
  },
  ["cube-deep-powder"] = {
    type = "item",
    text_overlay = "D",
    nested_prototypes = {
      { "recipe", "cube-deep-core-crushing" },
    },
  },

  ["cube-ghost-wire"] = {
    type = "item",
    text_overlay = "G",
  },

  ["cube-bottled-anguish"] = {
    type = "item",
    text_overlay = "A",
  },
  ["cube-bottled-consciousness"] = {
    type = "item",
    text_overlay = "C",
  },
  ["cube-bottled-euphoria"] = {
    type = "item",
    text_overlay = "E",
  },

  ["cube-boson-conduit"] = {
    type = "item",
    text_overlay = "B",
    nested_prototypes = {
      { "recipe", "cube-conduit-conversion-a" },
    },
  },
  ["cube-fermion-conduit"] = {
    type = "item",
    text_overlay = "F",
    nested_prototypes = {
      { "recipe", "cube-conduit-conversion-b" },
    },
  },

  ["cube-qubit-0"] = {
    type = "item",
    text_overlay = "U",
  },
  ["cube-qubit-1"] = {
    type = "item",
    text_overlay = "D",
  },
  ["cube-qubit-2"] = {
    type = "item",
    text_overlay = "S",
  },
  ["cube-qubit-3"] = {
    type = "item",
    text_overlay = "C",
  },
  ["cube-qubit-4"] = {
    type = "item",
    text_overlay = "T",
  },
  ["cube-qubit-5"] = {
    type = "item",
    text_overlay = "B",
  },

  ["cube-ultradense-mineral"] = {
    type = "item",
    icon_overlay_from = { "item", "cube-ultradense-utility-cube" },
    text_overlay = "U",
  },

  ["cube-deep-solution"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-deep-solution" },
    text_overlay = "D",
    nested_prototypes = {
      { "recipe", "cube-deep-solution" },
    },
  },
  ["cube-despair"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-despair" },
    text_overlay = "D",
  },
  ["cube-elbow-grease"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-elbow-grease" },
    text_overlay = "G",
    nested_prototypes = {
      { "recipe", "cube-elbow-grease" },
    },
  },
  ["cube-ethanol"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-ethanol" },
    text_overlay = "E",
    nested_prototypes = {
      { "recipe", "cube-ethanol" },
    },
  },
  ["cube-gelatinous-tar"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-gelatinous-tar" },
    text_overlay = "T",
    nested_prototypes = {
      { "recipe", "cube-gelatinous-tar" },
    },
  },
  ["cube-joy"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-joy" },
    text_overlay = "J",
  },
  ["cube-heavy-tar"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-heavy-tar" },
    text_overlay = "R",
  },
  ["cube-light-tar"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-light-tar" },
    text_overlay = "O",
  },
  ["cube-matter-replication-gel"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-matter-replication-gel" },
    text_overlay = "M",
    nested_prototypes = {
      { "recipe", "cube-matter-replication-gel" },
    },
  },
  ["cube-mineral-water"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-mineral-water" },
    text_overlay = "M",
  },
  ["cube-sulfuric-acid"] = table_merge(BasePrototypes["sulfuric-acid"], {
    config_from = "sulfuric-acid",
    type = "recipe",
  }),
  ["cube-ultradense-sap"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-ultradense-sap" },
    text_overlay = "U",
  },
  ["cube-unstable-gas"] = {
    type = "fluid",
    localised_name = { "fluid-name.cube-unstable-gas" },
    text_overlay = "U",
    nested_prototypes = {
      { "recipe", "cube-unstable-gas" },
    },
  },
}

return Prototypes
