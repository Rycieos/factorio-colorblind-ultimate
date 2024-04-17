local Root = "__colorblind_ultimate__"
local Icons = Root.."/graphics/icons/"

local function config(name)
  return settings.startup["colorblind_ultimate__" .. name].value
end

-- Overwrite the default icon.
local function replace_icon(_type, item, icon)
  data.raw[_type][item].icons = {icon}
end

-- Overlay an icon on top of the base icon.
local function overlay_icon(_type, item, icon, icon2)
  local obj = data.raw[_type][item]
  if obj.icons then
    table.insert(obj.icons, icon)
  else
    obj.icons = {
      {
        icon = obj.icon,
        icon_size = obj.icon_size,
        icon_mipmaps = obj.icon_mipmaps,
      },
      icon,
    }
  end

  if icon2 then
    table.insert(obj.icons, icon2)
  end
end

-- Overlay a sprite over a picture, which is used for ground rendering.
local function overlay_picture(_type, item, sprite, sprite2)
  local obj = data.raw[_type][item]
  table.insert(obj.pictures.layers, sprite)
  if sprite2 then
    table.insert(obj.pictures.layers, sprite2)
  end
end

-- Overlay a sprite over an array of pictures, which is used for ground rendering.
local function overlay_pictures(_type, item, sprite, sprite2)
  local obj = data.raw[_type][item]
  local pictures = {}
  for _, picture in ipairs(obj.pictures) do
    local layers = {picture, sprite}
    if sprite2 then
      table.insert(layers, sprite2)
    end
    table.insert(pictures, {layers = layers})
  end
  obj.pictures = pictures
end

-- Convert an icon format to a sprite format. Used when the on ground icon does
-- not match the inventory icon, because then it is a sprite/picture.
local function icon_to_sprite(icon)
  local sprite = {
    filename = icon["icon"],
    size = icon["icon_size"],
    mipmaps = icon["icon_mipmaps"],
  }
  if not icon["scale"] ~= nil then
    sprite["scale"] = icon["scale"] / 2
  end
  if not icon["shift"] ~= nil then
    sprite["shift"] = {
      icon["shift"][1] * 0.015,
      icon["shift"][2] * 0.015,
    }
  end
  return sprite
end

-- Merge two tables, with t2 overriding values from t1.
local function table_merge(t1, t2)
  local t = {}
  for k,v in pairs(t1) do
    t[k] = v
  end
  for k,v in pairs(t2) do
    t[k] = v
  end
  return t
end

local copper_icon
if config("copper-plate-custom") then
  copper_icon = Icons .. "copper-plate.png"
  replace_icon("item", "copper-plate", {
    icon = copper_icon,
    icon_size = 64,
    icon_mipmaps = 4,
  })
else
  copper_icon = "__base__/graphics/icons/copper-plate.png"
end

if config("electronic-circuit-custom") then
  replace_icon("item", "electronic-circuit", {
    icon = Icons .. "electronic-circuit.png",
    icon_size = 64,
    icon_mipmaps = 4,
  })
end

local scale = config("scale")

local mip_overlay = {
  icon_size = 32,
  icon_mipmaps = 2,
}

local constant_overlay = {
  icon_size = 128,
  icon_mipmaps = 3,
  scale = scale * 0.4,
  shift = {-8, 8},
}

local tooltip_overlay = {
  icon_size = 40,
  icon_mipmaps = 2,
  scale = scale * 0.8,
  shift = {-8, 8},
}

-- > Defaults to 32/icon_size for items and recipes
local icon_overlay = {
  icon_size = 64,
  icon_mipmaps = 4,
  scale = scale * 0.5,
  shift = {-8, 8},
}
local centered_icon_overlay = table_merge(icon_overlay, {
  shift = {0, 8},
})

overlay_icon("blueprint", "blueprint", table_merge(mip_overlay, {
  icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-blueprint-x32-white.png",
}))
overlay_icon("deconstruction-item", "deconstruction-planner", table_merge(mip_overlay, {
  icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png",
}))
overlay_icon("upgrade-item", "upgrade-planner", table_merge(mip_overlay, {
  icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-upgrade-planner-x32-white.png",
}))

local nuclear_overlay = table_merge(tooltip_overlay, {
  icon = "__base__/graphics/icons/tooltips/tooltip-category-nuclear.png",
})
local nuclear_sprite_overlay = icon_to_sprite(nuclear_overlay)
overlay_icon("item", "nuclear-fuel", nuclear_overlay)
overlay_icon("item", "uranium-235", nuclear_overlay)
overlay_icon("item", "uranium-fuel-cell", nuclear_overlay)
overlay_icon("ammo", "uranium-cannon-shell", nuclear_overlay)
overlay_icon("ammo", "uranium-rounds-magazine", nuclear_overlay)
overlay_icon("ammo", "atomic-bomb", nuclear_overlay)
overlay_picture("item", "nuclear-fuel", nuclear_sprite_overlay)
overlay_picture("item", "uranium-235", nuclear_sprite_overlay)
overlay_picture("item", "uranium-fuel-cell", nuclear_sprite_overlay)
overlay_picture("ammo", "uranium-cannon-shell", nuclear_sprite_overlay)
overlay_picture("ammo", "uranium-rounds-magazine", nuclear_sprite_overlay)
overlay_picture("ammo", "atomic-bomb", nuclear_sprite_overlay)

local explosive_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/explosives.png",
})
overlay_icon("ammo", "explosive-cannon-shell", explosive_overlay)
overlay_icon("ammo", "explosive-rocket", explosive_overlay)
overlay_icon("capsule", "cluster-grenade", explosive_overlay)

local cliff_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/cliff.png",
})
overlay_icon("capsule", "cliff-explosives", cliff_overlay)

local shifted_explosive_overlay = table_merge(explosive_overlay, {
  shift = {-8, -8},
})
overlay_icon("ammo", "explosive-uranium-cannon-shell", nuclear_overlay, shifted_explosive_overlay)
overlay_picture("ammo", "explosive-uranium-cannon-shell", nuclear_sprite_overlay, icon_to_sprite(shifted_explosive_overlay))

-- TODO: improve graphic.
local piercing_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/iron-stick.png",
})
overlay_icon("ammo", "piercing-rounds-magazine", piercing_overlay)
overlay_icon("ammo", "piercing-shotgun-shell", piercing_overlay)

local productivity_overlay = table_merge(constant_overlay, {
  icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
})
overlay_icon("module", "productivity-module", productivity_overlay)
overlay_icon("module", "productivity-module-2", productivity_overlay)
overlay_icon("module", "productivity-module-3", productivity_overlay)

local effectivity_overlay = table_merge(constant_overlay, {
  icon = "__core__/graphics/icons/technology/constants/constant-battery.png",
})
overlay_icon("module", "effectivity-module", effectivity_overlay)
overlay_icon("module", "effectivity-module-2", effectivity_overlay)
overlay_icon("module", "effectivity-module-3", effectivity_overlay)

local speed_overlay = table_merge(constant_overlay, {
  icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
})
overlay_icon("module", "speed-module", speed_overlay)
overlay_icon("module", "speed-module-2", speed_overlay)
overlay_icon("module", "speed-module-3", speed_overlay)
overlay_icon("capsule", "slowdown-capsule", speed_overlay)

-- TODO: fix these for entities.
local pushes_overlay = table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/pushes.png",
})
overlay_icon("item", "logistic-chest-active-provider", pushes_overlay)

overlay_icon("item", "logistic-chest-passive-provider", table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/generates.png",
}))
overlay_icon("item", "logistic-chest-buffer", table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/buffer.png",
}))
overlay_icon("item", "logistic-chest-requester", table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/consumes.png",
}))

local storage_overlay = table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/storage.png",
})
overlay_icon("item", "logistic-chest-storage", storage_overlay)


overlay_icon("tool", "automation-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/iron-gear-wheel.png",
}))
overlay_icon("tool", "logistic-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/inserter.png",
}))
overlay_icon("tool", "military-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
}))
overlay_icon("tool", "chemical-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
}))
overlay_icon("tool", "production-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/productivity-module.png",
}))
overlay_icon("tool", "utility-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/processing-unit.png",
}))
overlay_icon("tool", "space-science-pack", table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/satellite.png",
}))

-- TODO: fix these for entities.
overlay_icon("item", "fast-inserter", speed_overlay)

local filter_overlay = table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/filter.png",
})
overlay_icon("item", "filter-inserter", filter_overlay)

overlay_icon("item", "stack-inserter", storage_overlay)

local shifted_filter_overlay = table_merge(filter_overlay, {
  shift = {-8, -8},
})
overlay_icon("item", "stack-filter-inserter", storage_overlay, shifted_filter_overlay)

overlay_icon("item", "long-handed-inserter", pushes_overlay)

local coal_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/coal.png",
})
overlay_icon("item", "burner-inserter", coal_overlay)

local iron_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/iron-plate.png",
})
overlay_icon("item", "iron-ore", iron_overlay)
overlay_pictures("item", "iron-ore", icon_to_sprite(iron_overlay))
local copper_overlay = table_merge(icon_overlay, {
  icon = copper_icon,
})
overlay_icon("item", "copper-ore", copper_overlay)
overlay_pictures("item", "copper-ore", icon_to_sprite(copper_overlay))
local uranium_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/uranium-238.png",
})
overlay_icon("item", "uranium-ore", uranium_overlay)
overlay_pictures("item", "uranium-ore", icon_to_sprite(uranium_overlay))
local stone_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/stone-brick.png",
})
overlay_icon("item", "stone", stone_overlay)
overlay_pictures("item", "stone", icon_to_sprite(stone_overlay))

local oil_overlay = table_merge(centered_icon_overlay, {
  icon = "__base__/graphics/icons/pumpjack.png",
})
overlay_icon("fluid", "crude-oil", oil_overlay)
overlay_icon("item", "crude-oil-barrel", oil_overlay)
local lube_overlay = table_merge(centered_icon_overlay, {
  icon = "__base__/graphics/icons/iron-gear-wheel.png",
})
overlay_icon("fluid", "lubricant", lube_overlay)
overlay_icon("item", "lubricant-barrel", lube_overlay)

local water_setting = config("water-custom")
if water_setting ~= "none" then
  local water_icon = {
    icon = Icons .. "h2o.png",
    icon_size = 64,
    icon_mipmaps = 4,
  }

  local water_overlay
  if water_setting == "text" then
    water_overlay = table_merge(centered_icon_overlay, {
      icon = Icons .. "h2o-text.png",
      icon_size = 64,
      icon_mipmaps = 2,
    })
  else
    water_overlay = table_merge(centered_icon_overlay, water_icon)
  end
  overlay_icon("item", "water-barrel", water_overlay)

  if water_setting == "h2o" then
    replace_icon("fluid", "water", water_icon)
  else
    overlay_icon("fluid", "water", water_overlay)
  end
end
