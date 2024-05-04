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
  "base",
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
  local obj = self.raw[_type][name]
  if not obj then
    log("Warning: prototype [" .. _type .. "][" .. name .. "] not found")
    return false
  end
  return obj
end

-- Get the item object that corresponds to the entity object.
function get_item_from_entity(obj)
  return data:get("item", obj.minable.result)
end

function config_name(name)
  return Mod .. "__" .. name
end
