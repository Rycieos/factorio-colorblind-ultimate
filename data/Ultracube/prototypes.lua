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
