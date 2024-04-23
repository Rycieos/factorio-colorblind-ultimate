Mod = "colorblind_ultimate"
ModPath = "__" .. Mod .. "__"

Options = {
  none = "none",
  tier = "tier-overlay",
  tier_icon = "tier-overlay-icon",
  tier_entity = "tier-overlay-entity",
  icon = "icon",
  entity = "entity",
  icon_and_entity = "icon-and-entity",
  icon_overlay = "icon-overlay",
  icon_overlay_icon = "icon-overlay-icon",
  icon_overlay_entity = "icon-overlay-entity",
  text_overlay = "text-overlay",
}

SignalColors = {
  "signal-black",
  "signal-blue",
  "signal-cyan",
  "signal-green",
  "signal-grey",
  "signal-pink",
  "signal-red",
  "signal-white",
  "signal-yellow",
}

CircuitBackgrounds = {
  blue = {221, 72},
  dark_blue = {221, 36},
  green = {111, 108},
  grey = {111, 0},
  orange = {75, 108},
  red = {111, 36},
  yellow = {111, 72},
}

-- Merge two tables, with t2 overriding values from t1.
function table_merge(t1, t2)
  local t = {}
  for k,v in pairs(t1) do
    t[k] = v
  end
  for k,v in pairs(t2) do
    t[k] = v
  end
  return t
end

function keys(table)
  local keys = {}
  for key, _ in pairs(table) do
    keys[#keys+1] = key
  end
  return keys
end

-- Get the item object that corresponds to the entity object.
function get_item_from_entity(obj)
  return data.raw["item"][obj.minable.result]
end

function config_name(name)
  return Mod .. "__" .. name
end
