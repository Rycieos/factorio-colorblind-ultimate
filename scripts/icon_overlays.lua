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
    icon = path and path or IconPath .. "tooltips/" .. name .. ".png",
  })
end

local function create_icon(name, path)
  create_overlay(name, BaseOverlays.icon, {
    icon = path and path or BaseIconPath .. name .. ".png",
  })
end

create_mip("blueprint", BaseIconPath .. "shortcut-toolbar/mip/new-blueprint-x32-white.png")
create_mip("deconstruction-planner", BaseIconPath .. "shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png")
create_mip("upgrade-planner", BaseIconPath .. "shortcut-toolbar/mip/new-upgrade-planner-x32-white.png")

create_constant("effectivity", CoreIconPath .. "technology/constants/constant-battery.png")
create_constant("productivity", CoreIconPath .. "technology/constants/constant-mining-productivity.png")
create_constant("speed", CoreIconPath .. "technology/constants/constant-speed.png")

create_tooltip("buffer")
create_tooltip("consumes")
create_tooltip("filter")
create_tooltip("generates")
create_tooltip("nuclear", BaseIconPath .. "tooltips/tooltip-category-nuclear.png")
create_tooltip("pushes")
create_tooltip("storage")

create_icon("cliff")
create_icon("coal")
create_icon("copper-plate")
create_icon("explosives")
create_icon("inserter")
create_icon("iron-gear-wheel")
create_icon("iron-plate")
create_icon("petroleum-gas", BaseIconPath .. "fluid/petroleum-gas.png")
create_icon("piercing", BaseIconPath .. "iron-stick.png")
create_icon("piercing-rounds-magazine")
create_icon("processing-unit")
create_icon("productivity-module")
create_icon("pumpjack")
create_icon("satellite")
create_icon("stone-brick")
create_icon("sulfuric-acid", BaseIconPath .. "fluid/sulfuric-acid.png")
create_icon("uranium", BaseIconPath .. "uranium-238.png")

for name, icon in pairs(Icons) do
  create_overlay(name, BaseOverlays.icon, icon)
end
