local Root = "__colorblind_ultimate__"
local Icons = Root.."/graphics/icons/"

local function config(name)
  return settings.startup["colorblind_ultimate__" .. name].value
end

local function override_icon(name)
  data.raw["item"][name].icon = Icons .. name .. ".png"
end

local function overlay_icon(_type, item, icon, icon2)
  local obj = data.raw[_type][item]
  obj.icons = {
    {
      icon = obj.icon,
      icon_size = obj.icon_size,
      icon_mipmaps = obj.icon_mipmaps,
    },
    icon,
  }

  if icon2 then
    table.insert(obj.icons, icon2)
  end
end

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

if config("electronic-circuit-custom") then
  override_icon("electronic-circuit")
end

local mip_overlay = {
  icon_size = 32,
  icon_mipmaps = 2,
}

local tooltip_overlay = {
  icon_size = 40,
  icon_mipmaps = 2,
  scale = 0.4,
  shift = {-8, 8},
}

local icon_overlay = {
  icon_size = 64,
  icon_mipmaps = 4,
  scale = 0.25,
  shift = {-8, 8},
}

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
overlay_icon("item", "nuclear-fuel", nuclear_overlay)
overlay_icon("item", "uranium-235", nuclear_overlay)
overlay_icon("item", "uranium-fuel-cell", nuclear_overlay)
overlay_icon("ammo", "uranium-cannon-shell", nuclear_overlay)
overlay_icon("ammo", "uranium-rounds-magazine", nuclear_overlay)
overlay_icon("ammo", "atomic-bomb", nuclear_overlay)

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

local piercing_overlay = table_merge(icon_overlay, {
  icon = "__base__/graphics/icons/iron-stick.png",
})
overlay_icon("ammo", "piercing-rounds-magazine", piercing_overlay)
overlay_icon("ammo", "piercing-shotgun-shell", piercing_overlay)

local productivity_overlay = table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/gear.png",
})
overlay_icon("module", "productivity-module", productivity_overlay)
overlay_icon("module", "productivity-module-2", productivity_overlay)
overlay_icon("module", "productivity-module-3", productivity_overlay)

local effectivity_overlay = table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/electricity.png",
})
overlay_icon("module", "effectivity-module", effectivity_overlay)
overlay_icon("module", "effectivity-module-2", effectivity_overlay)
overlay_icon("module", "effectivity-module-3", effectivity_overlay)

local speed_overlay = table_merge(tooltip_overlay, {
  icon = Icons .. "tooltips/speed.png",
})
overlay_icon("module", "speed-module", speed_overlay)
overlay_icon("module", "speed-module-2", speed_overlay)
overlay_icon("module", "speed-module-3", speed_overlay)

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
