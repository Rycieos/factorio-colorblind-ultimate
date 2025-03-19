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
    floating = true,
  },
  small_constant = {
    icon_size = 64,
    icon_mipmaps = 3,
    scale = IconScale * 0.4,
    shift = primary_shift,
    floating = true,
  },
  tooltip = {
    icon_size = 40,
    icon_mipmaps = 2,
    scale = IconScale * 0.8,
    shift = primary_shift,
    floating = true,
  },
  icon = {
    icon_size = 64,
    icon_mipmaps = 4,
    scale = IconScale * 0.5,
    shift = primary_shift,
    floating = true,
  },
  text = {
    icon_size = 64,
    icon_mipmaps = 2,
    scale = IconScale * 0.5,
    shift = primary_shift,
    floating = true,
  },
  shifted = {
    shift = secondary_shift,
  },
}

function create_overlay_from_icons(icons, shift, scale)
  icons = table.deepcopy(icons)
  shift = shift or primary_shift
  scale = scale or IconScale
  for _, icon in ipairs(icons) do
    icon.scale = (icon.scale or (32 / icon.icon_size)) * scale
    local original_shift = icon.shift or { 0, 0 }
    icon.shift = {
      original_shift[1] * scale + shift[1],
      original_shift[2] * scale + shift[2],
    }
  end
  return icons
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

local function create_small_constant(name, path)
  create_overlay(name, BaseOverlays.small_constant, {
    icon = path,
  })
end

local function create_tooltip(name, path)
  create_overlay(name, BaseOverlays.tooltip, {
    icon = path and path or IconPath .. "tooltips/" .. name .. ".png",
  })
end

local function create_large_tooltip(name, path)
  create_overlay(name, BaseOverlays.icon, {
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

create_mip("no-entry", IconPath .. "mip/no-entry.png")

create_constant("efficiency", CoreIconPath .. "technology/constants/constant-battery.png")
create_constant("productivity", CoreIconPath .. "technology/constants/constant-recipe-productivity.png")
create_constant("speed-constant", CoreIconPath .. "technology/constants/constant-speed.png")
create_constant("quality", CoreIconPath .. "technology/constants/constant-count.png")
create_small_constant("tier-1", IconPath .. "constants/tier-1.png")
create_small_constant("tier-2", IconPath .. "constants/tier-2.png")
create_small_constant("tier-3", IconPath .. "constants/tier-3.png")
create_small_constant("tier-4", IconPath .. "constants/tier-4.png")

create_large_tooltip("buffer")
create_large_tooltip("input")
create_tooltip("filter")
create_large_tooltip("fire")
create_large_tooltip("output")
create_tooltip("nuclear", BaseIconPath .. "tooltips/tooltip-category-nuclear.png")
create_large_tooltip("plus")
create_large_tooltip("pushes")
create_large_tooltip("snowflake")
create_large_tooltip("speed")
create_large_tooltip("stack")

create_icon("explosives")
create_icon("water-custom", IconPath .. "fluid/water.png")

create_text("A")
create_text("B")
create_text("Bn")
create_text("C")
create_text("Ch")
create_text("Cu")
create_text("D")
create_text("E")
create_text("Ex")
create_text("ExU")
create_text("F")
create_text("Fa")
create_text("Fc")
create_text("Fe")
create_text("Fh")
create_text("Fi")
create_text("G")
create_text("H")
create_text("Ho")
create_text("J")
create_text("L")
create_text("La")
create_text("LH")
create_text("Li")
create_text("Lu")
create_text("M")
create_text("O")
create_text("P")
create_text("Pd")
create_text("Q")
create_text("R")
create_text("S")
create_text("T")
create_text("SF")
create_text("U")

create_text("H2O")
-- Manually override scale.
TextOverlays["H2O"].scale = TextOverlays["H2O"].scale * 2
