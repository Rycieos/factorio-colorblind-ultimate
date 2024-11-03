local prototypes = require("data.base.prototypes")
settings_from_prototypes(prototypes)

add_bool_setting(
  "signal-colors",
  { "", { "gui.all" }, " ", { "gui.color" }, " ", { "item-group-name.signals" } },
  { "colorblind_ultimate-description.custom-icon" }
)

add_option_setting(
  "filled-barrels",
  { "", { "gui.all" }, " ", { "item-name.filled-barrel", { "factoriopedia.fluid" } } },
  {
    "fluid-icon",
    "fluid-overlay",
  }
)

add_bool_setting(
  "rail-chain-signal-blue",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-blue" } }
)
add_bool_setting(
  "rail-chain-signal-green",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-green" } }
)
add_bool_setting(
  "rail-chain-signal-red",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-red" } }
)
add_bool_setting(
  "rail-chain-signal-yellow",
  { "", { "entity-name.rail-chain-signal" }, " ", { "virtual-signal-name.signal-yellow" } }
)

add_bool_setting(
  "train-stop-signal-red",
  { "", { "entity-name.train-stop" }, " ", { "virtual-signal-name.signal-red" } }
)
