require("scripts/config")
require("scripts/icons")

primary_shift = Offsets[config("overlay-corner")]
secondary_shift = Offsets[config("secondary-overlay-corner")]

BaseOverlays = {
  mip = {
    icon_size = 32,
    icon_mipmaps = 2,
    scale = 1,
    shift = { 0, 0 },
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
  text = {
    icon_size = 64,
    icon_mipmaps = 2,
    scale = IconScale * 0.5,
    shift = primary_shift,
  },
  shifted = {
    shift = secondary_shift,
  },
}

function create_overlay_from_icons(icons, shift, scale)
  return util.combine_icons({}, icons, {
    shift = shift or primary_shift,
    scale = scale or IconScale,
  })
end

Overlays = {}
TextOverlays = {}

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

local function create_text(name)
  TextOverlays[name] = table_merge({
    icon = IconPath .. "text/" .. name .. ".png",
  }, BaseOverlays.text)
end

create_mip("blueprint", BaseIconPath .. "shortcut-toolbar/mip/new-blueprint-x32-white.png")
create_mip("deconstruction-planner", BaseIconPath .. "shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png")
create_mip("upgrade-planner", BaseIconPath .. "shortcut-toolbar/mip/new-upgrade-planner-x32-white.png")
create_mip("no-entry", IconPath .. "mip/no-entry.png")

create_constant("efficiency", CoreIconPath .. "technology/constants/constant-battery.png")
create_constant("productivity", CoreIconPath .. "technology/constants/constant-mining-productivity.png")
create_constant("speed", CoreIconPath .. "technology/constants/constant-speed.png")
create_constant("tier-1", IconPath .. "constants/tier-1.png")
create_constant("tier-2", IconPath .. "constants/tier-2.png")
create_constant("tier-3", IconPath .. "constants/tier-3.png")
create_constant("tier-4", IconPath .. "constants/tier-4.png")

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
create_icon("piercing", BaseIconPath .. "iron-stick.png")
create_icon("piercing-rounds-magazine")
create_icon("processing-unit")
create_icon("productivity-module")
create_icon("pumpjack")
create_icon("rock-big")
create_icon("satellite")
create_icon("stone-brick")
create_icon("sulfuric-acid", BaseIconPath .. "fluid/sulfuric-acid.png")
create_icon("uranium", BaseIconPath .. "uranium-238.png")

create_icon("flame-custom", IconPath .. "flame.png")
create_icon("water-custom", IconPath .. "fluid/water.png")

create_text("A")
create_text("B")
create_text("C")
create_text("Cu")
create_text("D")
create_text("E")
create_text("Ex")
create_text("F")
create_text("Fa")
create_text("Fe")
create_text("Fi")
create_text("G")
create_text("H")
create_text("J")
create_text("L")
create_text("LH")
create_text("Lu")
create_text("M")
create_text("O")
create_text("P")
create_text("R")
create_text("S")
create_text("T")
create_text("SF")
create_text("U")

create_text("H2O")
-- Manually override scale.
TextOverlays["H2O"].scale = TextOverlays["H2O"].scale * 2
