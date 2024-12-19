local math2d = require("__core__.lualib.math2d")

require("scripts.config")
require("scripts.utils")

-- Draw helper for agricultural tower.

-- Hardcoded as the API does not expose what tiles upgrade to what tiles at runtime.
local plant_tiles = {
  ["dirt-1"] = "green",
  ["dirt-2"] = "green",
  ["dirt-3"] = "green",
  ["dirt-4"] = "green",
  ["dirt-5"] = "green",
  ["dirt-6"] = "green",
  ["dirt-7"] = "green",
  ["dry-dirt"] = "green",
  ["grass-1"] = "green",
  ["grass-2"] = "green",
  ["grass-3"] = "green",
  ["grass-4"] = "green",
  ["red-desert-0"] = "green",
  ["red-desert-1"] = "green",
  ["red-desert-2"] = "green",
  ["red-desert-3"] = "green",

  ["natural-yumako-soil"] = "green",
  ["artificial-yumako-soil"] = "green",
  ["overgrowth-yumako-soil"] = "green",

  ["natural-jellynut-soil"] = "green",
  ["artificial-jellynut-soil"] = "green",
  ["overgrowth-jellynut-soil"] = "green",

  ["lowland-brown-blubber"] = "yellow",
  ["lowland-olive-blubber"] = "yellow",
  ["lowland-olive-blubber-2"] = "yellow",
  ["lowland-olive-blubber-3"] = "yellow",
  ["lowland-pale-green"] = "yellow",
  ["wetland-green-slime"] = "yellow",
  ["wetland-light-green-slime"] = "yellow",
  ["wetland-yumako"] = "yellow",

  ["lowland-cream-red"] = "yellow",
  ["lowland-red-infection"] = "yellow",
  ["lowland-red-vein"] = "yellow",
  ["lowland-red-vein-2"] = "yellow",
  ["lowland-red-vein-3"] = "yellow",
  ["lowland-red-vein-4"] = "yellow",
  ["lowland-red-vein-dead"] = "yellow",
  ["wetland-jellynut"] = "yellow",
  ["wetland-pink-tentacle"] = "yellow",
  ["wetland-red-tentacle"] = "yellow",
}

local plant_green_tile_names = {}
local plant_yellow_tile_names = {}
for tile_name, color in pairs(plant_tiles) do
  if color == "green" then
    table.insert(plant_green_tile_names, tile_name)
  else
    table.insert(plant_yellow_tile_names, tile_name)
  end
end

local function is_player_selecting_agricultural_tower(player)
  if player.selected then
    if player.selected.name == "agricultural-tower" then
      return true
    end
    if player.selected.type == "entity-ghost" and player.selected.ghost_name == "agricultural-tower" then
      return true
    end
  end
  return false
end

script.on_event(defines.events.on_selected_entity_changed, function(event)
  if not storage.agri_objects then
    storage.agri_objects = {}
  end
  if storage.agri_objects[event.player_index] then
    for _, item in pairs(storage.agri_objects[event.player_index]) do
      item.destroy()
    end
    storage.agri_objects[event.player_index] = nil
  end

  local player = game.get_player(event.player_index)
  if is_player_selecting_agricultural_tower(player) then
    local player_config_green = player_config(player, "agricultural-tower-visual-green")
    local player_config_red = player_config(player, "agricultural-tower-visual-red")
    local player_config_yellow = player_config(player, "agricultural-tower-visual-yellow")
    if not player_config_green and not player_config_red and not player_config_yellow then
      return
    end
    local player_config_alt = player_config(player, "agricultural-tower-visual-alt")

    local sprites = {}
    local position = player.selected.position
    -- 3 sized squares and 3 radius is set in the prototype, but is unreadable at runtime.
    for x = -9, 9, 3 do
      for y = -9, 9, 3 do
        -- Skip the 3x3 grid the tower is on.
        if x == 0 and y == 0 then
          goto continue
        end

        local grid_position = math2d.position.add(position, { x, y })
        local bounding_box = math2d.bounding_box.create_from_centre(grid_position, 2)
        local green_grid_count = player.selected.surface.count_tiles_filtered({
          area = bounding_box,
          name = plant_green_tile_names,
        })
        if green_grid_count == 9 then
          if player_config_green then
            table.insert(
              sprites,
              rendering.draw_sprite({
                sprite = ModPath .. "green-check",
                surface = player.selected.surface,
                target = grid_position,
                only_in_alt_mode = player_config_alt,
              })
            )
          end
          goto continue
        end

        local yellow_grid_count = player.selected.surface.count_tiles_filtered({
          area = bounding_box,
          name = plant_yellow_tile_names,
        })
        if green_grid_count + yellow_grid_count == 9 then
          if player_config_yellow then
            table.insert(
              sprites,
              rendering.draw_sprite({
                sprite = ModPath .. "warning",
                surface = player.selected.surface,
                target = grid_position,
                only_in_alt_mode = player_config_alt,
              })
            )
          end
        else
          if player_config_red then
            table.insert(
              sprites,
              rendering.draw_sprite({
                sprite = ModPath .. "no-entry",
                surface = player.selected.surface,
                target = grid_position,
                only_in_alt_mode = player_config_alt,
              })
            )
          end
        end

        ::continue::
      end
    end

    storage.agri_objects[event.player_index] = sprites
  end
end)
