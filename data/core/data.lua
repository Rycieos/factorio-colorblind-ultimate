require("scripts.config")
require("scripts.updates")
require("scripts.utils")
require("data.core.utils")

-- Replace the specified color if the setting is changed from the default.
-- Since the Color is passed directly in, we need to reassign its values rather
-- than assign a whole new table.
---@param name string
---@param obj Color
local function do_replace_color(name, obj)
  do_if_color_setting(name, function(color)
    for key, value in pairs(color) do
      obj[key] = value
    end
  end)
end

-- Custom power pole wire sprites.
---@param name string
function do_replace_wire_sprite(name)
  do_if_color_setting(name .. "-sprite", function(color)
    local sprite = data.raw["utility-sprites"].default[name]
    sprite.filename = ModPath .. "/graphics/base-wire.png"
    sprite.tint = color
  end)
end

do_replace_wire_sprite("copper_wire")
do_replace_wire_sprite("green_wire")
do_replace_wire_sprite("red_wire")

-- Custom circuit background color sprites.
---@param config_name string
---@param button_name string
function do_replace_slot_old_background(config_name, button_name)
  do_if_color_setting(config_name, function(color)
    data.raw["gui-style"].default[button_name].default_graphical_set = {
      border = 1,
      filename = ModPath .. "/graphics/gui.png",
      position = { 0, 0 },
      size = 36,
      scale = 1,
      tint = color,
    }
  end)
end

do_replace_slot_old_background("green-circuit-background", "green_circuit_network_content_slot")
do_replace_slot_old_background("red-circuit-background", "red_circuit_network_content_slot")

---@param color Color
---@param style_name string
function replace_button_background(color, style_name)
  local style = data.raw["gui-style"].default[style_name]
  style.default_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.default_graphical_set.base.position = { 38, 0 }
  style.default_graphical_set.base.tint = color
  style.disabled_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.disabled_graphical_set.base.position = { 89, 0 }
  style.disabled_graphical_set.base.tint = color
  style.hovered_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.hovered_graphical_set.base.position = { 55, 0 }
  style.hovered_graphical_set.base.tint = color
  style.hovered_graphical_set.glow.tint = color
  style.clicked_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.clicked_graphical_set.base.position = { 72, 0 }
  style.clicked_graphical_set.base.tint = color
end

---@param color Color
---@param style_name string
function replace_slot_background(color, style_name)
  local style = data.raw["gui-style"].default[style_name]
  style.default_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.default_graphical_set.base.position = { 0, 116 }
  style.default_graphical_set.base.tint = color
  style.hovered_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.hovered_graphical_set.base.position = { 80, 116 }
  style.hovered_graphical_set.base.tint = color
  if style.hovered_graphical_set.glow then
    style.hovered_graphical_set.glow.tint = color
  end
  style.clicked_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.clicked_graphical_set.base.position = { 160, 116 }
  style.clicked_graphical_set.base.tint = color
  if style.selected_graphical_set then
    style.selected_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
    style.selected_graphical_set.base.position = { 80, 116 }
    style.selected_graphical_set.base.tint = color
  end
end

---@param color Color
---@param style_name string
function replace_slot_button_background(color, style_name)
  local style = data.raw["gui-style"].default[style_name]
  style.default_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.default_graphical_set.base.position = { 0, 36 }
  style.default_graphical_set.base.tint = color
  style.disabled_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.disabled_graphical_set.base.position = { 89, 0 }
  style.disabled_graphical_set.base.tint = color
  style.hovered_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.hovered_graphical_set.base.position = { 80, 36 }
  style.hovered_graphical_set.base.tint = color
  style.hovered_graphical_set.glow.tint = color
  style.clicked_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.clicked_graphical_set.base.position = { 160, 36 }
  style.clicked_graphical_set.base.tint = color
end

---@param color Color
---@param style_name string
function replace_slot_sized_button_background(color, style_name)
  local style = data.raw["gui-style"].default[style_name]
  style.default_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.default_graphical_set.base.position = { 125, 0 }
  style.default_graphical_set.base.tint = color
  style.disabled_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.disabled_graphical_set.base.position = { 142, 0 }
  style.disabled_graphical_set.base.tint = color
  style.hovered_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.hovered_graphical_set.base.position = { 159, 0 }
  style.hovered_graphical_set.base.tint = color
  style.hovered_graphical_set.glow.tint = color
  style.clicked_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.clicked_graphical_set.base.position = { 176, 0 }
  style.clicked_graphical_set.base.tint = color
end

---@param color Color
---@param style_name string
function replace_tool_button_background(color, style_name)
  local style = data.raw["gui-style"].default[style_name]
  style.default_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.default_graphical_set.base.position = { 38, 19 }
  style.default_graphical_set.base.tint = color
  style.hovered_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.hovered_graphical_set.base.position = { 55, 19 }
  style.hovered_graphical_set.base.tint = color
  style.hovered_graphical_set.glow.tint = color
  style.clicked_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
  style.clicked_graphical_set.base.position = { 72, 19 }
  style.clicked_graphical_set.base.tint = color
  if style.selected_graphical_set then
    style.selected_graphical_set.base.filename = ModPath .. "/graphics/gui.png"
    style.selected_graphical_set.base.position = { 72, 19 }
    style.selected_graphical_set.base.tint = color
  end
end

-- Do not replace slider backgrounds (blue_slider, green_, red_), as those are
-- used for color pickers. That was a good laugh.

do_if_color_setting("blue_slot_background", function(color)
  replace_slot_background(color, "blue_slot")
  replace_slot_sized_button_background(color, "slot_sized_button_blue")
  replace_tool_button_background(color, "tool_button_blue")
end)
do_if_color_setting("green_slot_background", function(color)
  replace_button_background(color, "green_button")
  -- Used for green circuit network slots in combinators.
  replace_slot_background(color, "green_slot")
  replace_slot_sized_button_background(color, "slot_sized_button_green")
  replace_tool_button_background(color, "tool_button_green")
end)
do_if_color_setting("red_slot_background", function(color)
  replace_button_background(color, "red_button")
  -- Used for red circuit network slots in combinators.
  replace_slot_background(color, "red_slot")
  replace_slot_background(color, "red_inventory_slot")
  replace_slot_background(color, "not_working_weapon_button")
  replace_slot_button_background(color, "red_slot_button")
  replace_slot_sized_button_background(color, "slot_sized_button_red")
end)
do_if_color_setting("yellow_slot_background", function(color)
  replace_slot_background(color, "yellow_slot")
  replace_slot_button_background(color, "yellow_slot_button")
end)

-- red network text color?
-- green network text color?

-- Custom roboport range sprites.
---@param name string
function do_replace_robot_range_sprite(name)
  do_if_color_setting(name, function(color)
    local sprite = data.raw["utility-sprites"].default[name]
    sprite.filename = ModPath .. "/graphics/visualization-radius.png"
    sprite.tint = color
  end)
end

do_replace_robot_range_sprite("construction_radius_visualization")
do_replace_robot_range_sprite("logistic_radius_visualization")

-- Custom GUI colors
local utility_colors = data.raw["utility-constants"].default
local chart_colors = utility_colors.chart
do_replace_color("artillery_range", utility_colors.artillery_range_visualization_color)
do_replace_color("artillery_range_map", chart_colors.artillery_range_color)
do_replace_color("capsule_range", utility_colors.capsule_range_visualization_color)
do_replace_color("enemy", chart_colors.default_enemy_color)
do_replace_color("enemy_territory", chart_colors.default_enemy_territory_color)
do_replace_color("turret_range", utility_colors.turret_range_visualization_color)
do_replace_color("turret_range_map", chart_colors.turret_range_color)

-- ghost_shader_tint and ghost_shaderless_tint were added in 2.0.15.
---@diagnostic disable-next-line: undefined-field
do_replace_color("ghost_shader_ghost_tint", utility_colors.ghost_tint or utility_colors.ghost_shader_tint.ghost_tint)
do_replace_color(
  "ghost_shader_ghost_delivery_tint",
  ---@diagnostic disable-next-line: undefined-field
  utility_colors.ghost_tint_delivering or utility_colors.ghost_shader_tint.ghost_delivery_tint
)
do_replace_color(
  "ghost_shader_tile_ghost_tint",
  ---@diagnostic disable-next-line: undefined-field
  utility_colors.tile_ghost_tint or utility_colors.ghost_shader_tint.tile_ghost_tint
)
do_replace_color(
  "ghost_shader_tile_ghost_delivery_tint",
  ---@diagnostic disable-next-line: undefined-field
  utility_colors.tile_ghost_tint_delivering or utility_colors.ghost_shader_tint.tile_ghost_delivery_tint
)
if utility_colors.ghost_shader_tint then
  do_replace_color("ghost_shader_wire_tint", utility_colors.ghost_shader_tint.wire_tint)
end
if utility_colors.ghost_shaderless_tint then
  do_replace_color("ghost_shader_ghost_tint", utility_colors.ghost_shaderless_tint.ghost_tint)
  do_replace_color("ghost_shader_ghost_delivery_tint", utility_colors.ghost_shaderless_tint.ghost_delivery_tint)
  do_replace_color("ghost_shader_tile_ghost_tint", utility_colors.ghost_shaderless_tint.tile_ghost_tint)
  do_replace_color(
    "ghost_shader_tile_ghost_delivery_tint",
    utility_colors.ghost_shaderless_tint.tile_ghost_delivery_tint
  )
  do_replace_color("ghost_shader_wire_tint", utility_colors.ghost_shaderless_tint.wire_tint)
end

-- Custom tech background colors
---@param config_name string
---@param default string
---@param tech_name string
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
do_replace_tech_background(
  "conditionally-available-technology-background-color",
  "orange",
  "conditionally_available_technology_slot"
)
do_replace_tech_background("unavailable-technology-background-color", "red", "unavailable_technology_slot")
do_replace_tech_background("researched-technology-background-color", "green", "researched_technology_slot")
do_replace_tech_background("disabled-technology-background-color", "grey", "disabled_technology_slot")
