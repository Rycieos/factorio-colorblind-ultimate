require("scripts.config")
require("scripts.icon_overlays")
require("scripts.icons")
require("scripts.sprites")

function update_resource_color(name)
  local setting = config(name .. "-map-color")
  if setting then
    local prototype = data:get("resource", name)
    if prototype and not color_equals(setting, prototype.map_color) then
      prototype.map_color = setting
    end
  end
end

function update_radius_visualization_color(_type, name, color)
  local prototype = data:get(_type, name)
  if prototype then
    local sprite = prototype.radius_visualisation_picture
    sprite.filename = ModPath .. "/graphics/visualization-radius.png"
    sprite.tint = color
  end
end

local function overlay_all_icons(obj, icon, icon2)
  overlay_icon(obj, icon, icon2)
  if obj.dark_background_icons or obj.dark_background_icon then
    overlay_dark_icon(obj, icon, icon2)
  end
  if obj.pictures then
    overlay_sprite_variation(obj.pictures, icon_to_sprite(icon), icon2 and icon_to_sprite(icon2))
  end
end

function do_replace_icon(name, proto, config_name, obj)
  config_name = config_name or name
  local setting = config(config_name .. "-icon-replacement")
  if not setting then
    return false
  end

  local icon = create_custom_icon(config_name, proto.icon_replacement)
  replace_icon(obj, icon)
  if proto.is_entity or proto.sprite_replacement then
    replace_icon(get_item_from_entity(obj), icon)
  end
  return true
end

function do_replace_sprite(name, proto, config_name, obj)
  config_name = config_name or name
  local setting = config(config_name .. "-sprite-replacement")
  if not (proto.is_entity or proto.sprite_replacement) or not setting then
    return false
  end

  replace_sprite(obj, proto.sprite_replacement)
  return true
end

function create_overlays(setting, proto)
  local icon, icon2
  if setting == Options.text_overlay then
    icon = TextOverlays[proto.text_overlay]
    icon2 = proto.text_overlay2 and table_merge(TextOverlays[proto.text_overlay2], BaseOverlays.shifted)
  elseif proto.icon_overlay_from then
    local from_obj = data:get(proto.icon_overlay_from[1], proto.icon_overlay_from[2])
    if from_obj then
      icon, icon2 = table.unpack(create_overlay_from_icons(icons_from_obj(from_obj)))
    end
  else
    icon = Overlays[proto.icon_overlay]
    icon2 = proto.icon_overlay2 and table_merge(Overlays[proto.icon_overlay2], BaseOverlays.shifted)
  end
  return icon, icon2
end

function do_overlay_icon(name, proto, config_name, obj)
  config_name = config_name or name

  local setting = config(config_name .. "-icon-overlay")
  local is_entity = proto.is_entity or proto.sprite_replacement
  if not setting or setting == Options.none then
    return false
  end

  local icon, icon2 = create_overlays(setting, proto)
  overlay_all_icons(obj, icon, icon2)
  if is_entity then
    overlay_all_icons(get_item_from_entity(obj), icon, icon2)
  end
  return true
end

function do_overlay_sprite(name, proto, config_name, obj)
  config_name = config_name or name

  local setting = config(config_name .. "-sprite-overlay")
  local is_entity = proto.is_entity or proto.sprite_replacement
  if not is_entity or not setting or setting == Options.none then
    return false
  end

  local icon, icon2 = create_overlays(setting, proto)
  overlay_sprites(obj, icon_to_sprite(icon), icon2 and icon_to_sprite(icon2))
  return true
end

function do_replace_and_overlay(name, proto, config_name)
  local obj = data:get(proto.type, name)
  if not obj then
    return false
  end

  local changed = do_replace_icon(name, proto, config_name, obj)
  changed = do_replace_sprite(name, proto, config_name, obj) or changed
  changed = do_overlay_icon(name, proto, config_name, obj) or changed
  changed = do_overlay_sprite(name, proto, config_name, obj) or changed

  return changed
end

-- <Prototype>:
-- Fields:
-- <key>: <string> Factorio prototype name.
-- type: <string> Factorio prototype type. Required.
-- localised_name: <LocalisedString>: Defaults to {"<is_entity and "entity" or "item">-name.<name>"}.
-- config_from: <string>: Config setting to check for enabling instead of own key.
-- order: <Order>: Used to sort settings.
-- is_entity: <bool>: Defaults to (bool)sprite_replacement.
-- sprite_replacement: <FileName>
-- icon_replacement: <bool|string>
-- icon_overlay: <string>
-- icon_overlay2 <string>
-- icon_overlay_from: Array<string>: prototype {type, name} to copy icon from as an overlay.
-- text_overlay: <string>
-- text_overlay2 <string>
-- nested_prototypes: Array<Array<string>>: prototype {type, name}s that should
--   be modified if the base prototype is enabled.
-- hooks: Array<function>
function apply_prototypes(prototypes)
  for name, proto in pairs(prototypes) do
    if do_replace_and_overlay(name, proto, proto.config_from) then
      if proto.nested_prototypes then
        for _, nested_proto in pairs(proto.nested_prototypes) do
          do_replace_and_overlay(
            nested_proto[2],
            table_merge(proto, { type = nested_proto[1] }),
            proto.config_from or name
          )
        end
      end
      if proto.hooks then
        for _, hook in pairs(proto.hooks) do
          hook(name, proto)
        end
      end
      proto.enabled = true
    end
  end
end
