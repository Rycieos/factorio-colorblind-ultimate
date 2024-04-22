require("scripts/config")
require("scripts/icons")

-- Overlay a transport belt.
-- overlay is the tier overlay. If icon is chosen, we can look it up from
-- the name.
function overlay_or_replace_transport_belt(name, overlay)
  local setting = config(name)
  if setting ~= Options.none then
    local obj = data.raw["transport-belt"][name]

    if setting == Options.icon then
      local icon = CustomIcons[name]
      replace_icon(obj, icon)
      replace_icon(data.raw.item[obj.minable.result], icon)
    elseif setting ~= Options.tier_entity then
      overlay_icon(obj, overlay)
      overlay_icon(data.raw.item[obj.minable.result], overlay)
    end
    if setting == Options.tier or setting == Options.tier_entity then
      overlay_rotated_animation(obj.belt_animation_set.animation_set, icon_to_sprite(overlay))
    end
  end
end

-- Overlay a static sprite over an RotatedAnimation.
-- A terrible hack, but the game requires a sprite per direction, even if
-- they are all exactly the same.
function overlay_rotated_animation(obj, sprite)
  if not obj.layers then
    obj.layers = {table.deepcopy(obj)}
  end
  local props = {
    frame_count = 1,
    line_length = 1,
    lines_per_file = 1,
    slice = 1,
    repeat_count = obj.layers[1].frame_count,
    direction_count = 20,
    filenames = {},
  }
  for i=1, 12 do
    table.insert(props.filenames, sprite.filename)
  end
  for i=1, 8 do
    table.insert(props.filenames, EmptyConstant.icon)
  end
  table.insert(obj.layers, table_merge(sprite, props))
end
