local prototypes = require("data.base.prototypes")
settings_from_prototypes(prototypes)

add_replace_setting("signal-colors", "All color signals")

add_overlay_setting("rail-chain-signal-blue", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-blue"},
})
add_overlay_setting("rail-chain-signal-green", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-green"},
})
add_overlay_setting("rail-chain-signal-red", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-red"},
})
add_overlay_setting("rail-chain-signal-yellow", {
  "",
  {"entity-name.rail-chain-signal"},
  " ",
  {"virtual-signal-name.signal-yellow"},
})

add_overlay_setting("train-stop-signal-red", {
  "",
  {"entity-name.train-stop"},
  " ",
  {"virtual-signal-name.signal-red"},
})
