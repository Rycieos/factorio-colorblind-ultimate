require("scripts/config")
require("scripts/icons")

BaseOverlays = {
  mip = {
    icon_size = 32,
    icon_mipmaps = 2,
  },
  constant = {
    icon_size = 128,
    icon_mipmaps = 3,
    scale = IconScale * 0.4,
    shift = {-8, 8},
  },
  tooltip = {
    icon_size = 40,
    icon_mipmaps = 2,
    scale = IconScale * 0.8,
    shift = {-8, 8},
  },
  icon = {
    icon_size = 64,
    icon_mipmaps = 4,
    scale = IconScale * 0.5,
    shift = {-8, 8},
  },
  shifted = {
    shift = {-8, -8},
  },
}

Overlays = {}

local function create_overlay(name, _type, icon)
  Overlays[name] = table_merge(icon, _type)
end

local function create_mip(name, path)
  create_overlay(name, BaseOverlays.mip, {
    icon = path,
  })
end

local function create_constant(name, path)
  create_overlay(name, BaseOverlays.constant, {
    icon = path,
  })
end

local function create_tooltip(name, path)
  create_overlay(name, BaseOverlays.tooltip, {
    icon = path,
  })
end

local function create_icon(name, path)
  create_overlay(name, BaseOverlays.icon, {
    icon = path,
  })
end

create_mip("blueprint", BaseIconPath .. "shortcut-toolbar/mip/new-blueprint-x32-white.png")
create_mip("deconstruction-planner", BaseIconPath .. "shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png")
create_mip("upgrade-planner", BaseIconPath .. "shortcut-toolbar/mip/new-upgrade-planner-x32-white.png")

create_constant("effectivity", CoreIconPath .. "technology/constants/constant-battery.png")
create_constant("productivity", CoreIconPath .. "technology/constants/constant-mining-productivity.png")
create_constant("speed", CoreIconPath .. "technology/constants/constant-speed.png")

create_tooltip("buffer-tooltip", IconPath .. "tooltips/buffer.png")
create_tooltip("consumes-tooltip", IconPath .. "tooltips/consumes.png")
create_tooltip("filter-tooltip", IconPath .. "tooltips/filter.png")
create_tooltip("generates-tooltip", IconPath .. "tooltips/generates.png")
create_tooltip("nuclear-tooltip", BaseIconPath .. "tooltips/tooltip-category-nuclear.png")
create_tooltip("pushes-tooltip", IconPath .. "tooltips/pushes.png")
create_tooltip("storage-tooltip", IconPath .. "tooltips/storage.png")

create_icon("cliff", BaseIconPath .. "cliff.png")
create_icon("coal", BaseIconPath .. "coal.png")
create_icon("copper-plate", BaseIconPath .. "copper-plate.png")
create_icon("explosives", BaseIconPath .. "explosives.png")
create_icon("inserter", BaseIconPath .. "inserter.png")
create_icon("iron-gear-wheel", BaseIconPath .. "iron-gear-wheel.png")
create_icon("iron-plate", BaseIconPath .. "iron-plate.png")
create_icon("petroleum-gas", BaseIconPath .. "fluid/petroleum-gas.png")
create_icon("piercing", BaseIconPath .. "iron-stick.png")
create_icon("piercing-rounds-magazine", BaseIconPath .. "piercing-rounds-magazine.png")
create_icon("processing-unit", BaseIconPath .. "processing-unit.png")
create_icon("productivity-module", BaseIconPath .. "productivity-module.png")
create_icon("pumpjack", BaseIconPath .. "pumpjack.png")
create_icon("satellite", BaseIconPath .. "satellite.png")
create_icon("stone-brick", BaseIconPath .. "stone-brick.png")
create_icon("sulfuric-acid", BaseIconPath .. "fluid/sulfuric-acid.png")
create_icon("uranium", BaseIconPath .. "uranium-238.png")

for name, icon in pairs(Icons) do
  create_overlay(name, BaseOverlays.icon, icon)
end
