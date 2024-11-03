local Prototypes = {
  ["quality-module"] = {
    type = "module",
    icon_overlay = "quality",
    text_overlay = "Q",
    nested_prototypes = {
      { "module", "quality-module-2" },
      { "module", "quality-module-3" },
    },
  },
}

return Prototypes
