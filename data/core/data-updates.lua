require("scripts.config")
require("scripts.updates")
require("scripts.utils")
require("data.core.constants")

-- Custom power pole wire sprites.
function do_replace_wire_sprite(name)
  local setting = config(name .. "-sprite-color")
  if setting ~= "" then
    local color = util.color(setting)
    local sprite = data.raw["utility-sprites"].default[name]
    sprite.filename = ModPath.."/graphics/base-wire.png"
    sprite.hr_version.filename = ModPath.."/graphics/hr-base-wire.png"
    sprite.tint = color
    sprite.hr_version.tint = color
  end
end

do_replace_wire_sprite("copper_wire")
do_replace_wire_sprite("green_wire")
do_replace_wire_sprite("red_wire")

-- Custom circuit background color sprites.
function do_replace_button_background(config_name, default, button_name)
  local setting = config(config_name)
  if setting ~= default then
    data.raw["gui-style"].default[button_name].default_graphical_set.position = OldButtonBackgrounds[setting]
  end
end

do_replace_button_background("green-circuit-background-color", "green", "green_circuit_network_content_slot")
do_replace_button_background("red-circuit-background-color", "red", "red_circuit_network_content_slot")

-- Custom roboport range sprites.
function do_replace_robot_range_sprite(name)
  local setting = config(name .. "-color")
  if setting ~= "" then
    local color = util.color(setting)
    local sprite = data.raw["utility-sprites"].default[name]
    sprite.filename = ModPath.."/graphics/visualization-radius.png"
    sprite.tint = color
  end
end

do_replace_robot_range_sprite("construction_radius_visualization")
do_replace_robot_range_sprite("logistic_radius_visualization")

-- Custom GUI colors
local chart_colors = data.raw["utility-constants"].default.chart
do_replace_color("artillery_range", chart_colors.artillery_range_color)
do_replace_color("capsule_range", data.raw["utility-constants"].default.capsule_range_visualization_color)
do_replace_color("enemy", chart_colors.default_enemy_color)
do_replace_color("pollution", chart_colors.pollution_color)
do_replace_color("turret_range", data.raw["utility-constants"].default.turret_range_visualization_color)
do_replace_color("turret_range_map", chart_colors.turret_range_color)

-- Custom tech background colors
function do_replace_tech_background(config_name, default, tech_name)
  local setting = config(config_name)
  if setting ~= default then
    local color = NewSlotBackgrounds[setting]
    local tech = data.raw["gui-style"].default[tech_name]

    tech.default_graphical_set.base.position = color.default
    tech.disabled_graphical_set.base.position = color.default
    tech.highlighted_graphical_set.base.position = color.highlighted
    tech.clicked_graphical_set.base.position = color.selected
    tech.hovered_graphical_set.base.position = color.selected
    tech.selected_graphical_set.base.position = color.selected
    tech.selected_clicked_graphical_set.base.position = color.selected
    tech.selected_hovered_graphical_set.base.position = color.selected
    tech.level_band.position = color.level_band
    tech.hovered_level_band.position = color.level_band
    tech.level_range_band.position = color.level_range
    tech.hovered_level_range_band.position = color.level_range
  end
end

do_replace_tech_background("available-technology-background-color", "light_orange", "available_technology_slot")
do_replace_tech_background("conditionally-available-technology-background-color", "orange", "conditionally_available_technology_slot")
do_replace_tech_background("unavailable-technology-background-color", "red", "unavailable_technology_slot")
do_replace_tech_background("researched-technology-background-color", "green", "researched_technology_slot")
do_replace_tech_background("disabled-technology-background-color", "grey", "disabled_technology_slot")
