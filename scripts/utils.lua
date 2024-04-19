Mod = "colorblind_ultimate"
ModPath = "__" .. Mod .. "__"

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

-- Get the item object that corresponds to the entity object.
function get_item_from_entity(obj)
  return data.raw["item"][obj.minable.result]
end

function config_name(name)
  return Mod .. "__" .. name
end
