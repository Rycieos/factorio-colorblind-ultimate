require("scripts/config")
require("scripts/icons")

primary_shift = Corners[config("overlay-corner")]
secondary_shift = Corners[config("secondary-overlay-corner")]

BaseOverlays = {
  mip = {
    icon_size = 32,
    icon_mipmaps = 2,
    scale = 1,
    shift = {0, 0},
  },
  constant = {
    icon_size = 128,
    icon_mipmaps = 3,
    scale = IconScale * 0.4,
    shift = primary_shift,
  },
  tooltip = {
    icon_size = 40,
    icon_mipmaps = 2,
    scale = IconScale * 0.8,
    shift = primary_shift,
  },
  icon = {
    icon_size = 64,
    icon_mipmaps = 4,
    scale = IconScale * 0.5,
    shift = primary_shift,
  },
  shifted = {
    shift = secondary_shift,
  },
}

function create_overlay_from_icons(icons, shift, scale)
  shift = shift or primary_shift
  scale = scale or IconScale

  for _, icon in ipairs(icons) do
    icon.scale = (icon.scale or 32 / icon.icon_size) * scale

    local original_shift = icon.shift or {0, 0}
    icon.shift = {
      original_shift[1] * 0.5 + shift[1],
      original_shift[2] * 0.5 + shift[2]
    }
  end
  return icons
end

Overlays = {}

local function create_overlay(name, _type, icon)
  Overlays[name] = table_merge(icon, _type)
end

local function create_custom_overlay(name, _type, icon)
  Overlays[name .. "-custom"] = create_overlay_from_icons({icon})[1]
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
create_mip("no-entry", IconPath .. "mip/no-entry.png")

create_constant("effectivity", CoreIconPath .. "technology/constants/constant-battery.png")
create_constant("productivity", CoreIconPath .. "technology/constants/constant-mining-productivity.png")
create_constant("speed", CoreIconPath .. "technology/constants/constant-speed.png")
create_constant("tier-1", IconPath .. "constants/tier-1.png")
create_constant("tier-2", IconPath .. "constants/tier-2.png")
create_constant("tier-3", IconPath .. "constants/tier-3.png")

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

for name, icon in pairs(CustomIcons) do
  create_custom_overlay(name, BaseOverlays.icon, table.deepcopy(icon))
end
