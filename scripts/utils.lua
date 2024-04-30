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
  text_overlay_icon = "text-overlay-icon",
  text_overlay_entity = "text-overlay-entity",
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

-- From core/graphics/gui.png
OldButtonBackgrounds = {
  blue = {221, 72},
  dark_blue = {221, 36},
  green = {111, 108},
  grey = {111, 0},
  orange = {75, 108},
  red = {111, 36},
  yellow = {111, 72},
}

-- From core/graphics/gui-new.png
NewSlotBackgrounds = {
  dark_blue = {
    default = {330, 48},
    selected = {364, 48},
    highlighted = {274, 71},
    level_band = {347, 48},
    level_range = {330, 48},
  },
  dark_red = {
    default = {136, 17},
    selected = {187, 17},
    highlighted = {240, 71},
    level_band = {170, 17},
    level_range = {136, 17},
  },
  dark_green = {
    default = {432, 48},
    selected = {466, 48},
    highlighted = {257, 71},
    level_band = {449, 48},
    level_range = {432, 48},
  },
  light_orange = {
    default = {296, 136},
    selected = {312, 136},
    highlighted = {330, 136},
    level_band = {381, 136},
    level_range = {397, 136},
  },
  orange = {
    default = {296, 153},
    selected = {312, 153},
    highlighted = {330, 153},
    level_band = {381, 153},
    level_range = {397, 153},
  },
  red = {
    default = {296, 170},
    selected = {312, 170},
    highlighted = {330, 170},
    level_band = {381, 170},
    level_range = {397, 170},
  },
  green = {
    default = {296, 187},
    selected = {312, 187},
    highlighted = {330, 187},
    level_band = {381, 187},
    level_range = {397, 187},
  },
  grey = {
    default = {296, 204},
    selected = {312, 204},
    highlighted = {330, 204},
    level_band = {381, 204},
    level_range = {397, 204},
  },
}

Offsets = {
  ["upper-left"]  = {-8, -8},
  ["upper-right"] = {8, -8},
  ["lower-left"]  = {-8, 8},
  ["lower-right"] = {8, 8},
  ["upper"]       = {0, -8},
  ["right"]       = {8, 0},
  ["left"]        = {-8, 0},
  ["lower"]       = {0, 8},
  ["center"]      = {0, 0},
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
