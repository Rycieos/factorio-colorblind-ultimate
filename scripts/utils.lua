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

-- stylua: ignore
Offsets = {
  ["upper-left"]  = { -8, -8 },
  ["upper-right"] = {  8, -8 },
  ["lower-left"]  = { -8,  8 },
  ["lower-right"] = {  8,  8 },
  ["upper"]       = {  0, -8 },
  ["right"]       = {  8,  0 },
  ["left"]        = { -8,  0 },
  ["lower"]       = {  0,  8 },
  ["center"]      = {  0,  0 },
}

Mods = {
  ["base"] = {
    data = true,
    updates = true,
    settings = true,
  },
}

-- Merge two tables, with t2 overriding values from t1.
function table_merge(t1, t2)
  local t = {}
  for k, v in pairs(t1) do
    t[k] = v
  end
  for k, v in pairs(t2) do
    t[k] = v
  end
  return t
end

function keys(table)
  local keys = {}
  for key, _ in pairs(table) do
    keys[#keys + 1] = key
  end
  return keys
end

function data:get(_type, name)
  local types = self.raw[_type]
  if not types or not types[name] then
    log("Warning: prototype [" .. _type .. "][" .. name .. "] not found")
    return false
  end
  return types[name]
end

-- Get the item object that corresponds to the entity object.
function get_item_from_entity(obj)
  return data:get("item", obj.minable.result)
end

function config_name(name)
  return Mod .. "__" .. name
end

function normalize_color(color)
  color = {
    r = color.r or color[1] or 0,
    g = color.g or color[2] or 0,
    b = color.b or color[3] or 0,
    a = color.a or color[4],
  }
  if color.r > 1 or color.g > 1 or color.b > 1 or (color.a and color.a > 1) then
    color.a = color.a or 255
    return color
  else
    return {
      r = color.r * 255,
      g = color.g * 255,
      b = color.b * 255,
      a = (color.a or 1) * 255,
    }
  end
end

function color_equals(color1, color2, epsilon)
  color1 = normalize_color(color1)
  color2 = normalize_color(color2)
  epsilon = epsilon or 1
  return math.abs(color1.r - color2.r) < epsilon
    and math.abs(color1.g - color2.g) < epsilon
    and math.abs(color1.b - color2.b) < epsilon
    and math.abs(color1.a - color2.a) < epsilon
end
