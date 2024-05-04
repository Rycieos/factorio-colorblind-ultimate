require("scripts.config")
require("scripts.icon_overlays")
require("scripts.icons")
require("scripts.sprites")

local function do_overlay_icon(obj, icon, icon2)
  overlay_icon(obj, icon, icon2)
  if obj.dark_background_icons or obj.dark_background_icon then
    overlay_dark_icon(obj, icon, icon2)
  end
  if obj.pictures then
    overlay_sprite_variation(obj.pictures, icon_to_sprite(icon, 0.5), icon2 and icon_to_sprite(icon2, 0.5))
  end
end

function do_replace_or_overlay(name, proto, config_name)
  local setting = config(config_name or name)
  if setting == Options.none then
    return false
  end

  local obj = data:get(proto.type, name)
  if not obj then
    return false
  end

  local is_entity = proto.is_entity or proto.sprite_replacement

  if setting == Options.icon or setting == Options.entity or setting == Options.icon_and_entity then
    if setting ~= Options.entity then
      local icon = create_custom_icon(name, proto.icon_replacement)
      replace_icon(obj, icon)
      if is_entity then
        replace_icon(get_item_from_entity(obj), icon)
      end
    end
    if setting ~= Options.icon then
      replace_sprite(obj, proto.sprite_replacement, proto.hr_sprite_replacement)
    end
  else -- Choose overlay
    local icon, icon2
    if
      setting == Options.text_overlay
      or setting == Options.text_overlay_entity
      or setting == Options.text_overlay_icon
    then
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

    if
      setting ~= Options.icon_overlay_entity
      and setting ~= Options.tier_entity
      and setting ~= Options.text_overlay_entity
    then
      do_overlay_icon(obj, icon, icon2)
      if is_entity then
        do_overlay_icon(get_item_from_entity(obj), icon, icon2)
      end
    end
    if
      setting ~= Options.icon_overlay_icon
      and setting ~= Options.tier_icon
      and setting ~= Options.text_overlay_icon
    then
      if not icon then
        log(name)
      end
      overlay_sprites(obj, icon_to_sprite(icon), icon2 and icon_to_sprite(icon2))
    end
  end
  return true
end

function do_replace_color(name, color)
  local setting = config(name .. "-color")
  if setting ~= "" then
    for key, value in pairs(util.color(setting)) do
      color[key] = value
    end
  end
end

function apply_prototypes(prototypes)
  for name, proto in pairs(prototypes) do
    if do_replace_or_overlay(name, proto) then
      if proto.nested_prototypes then
        for _, nested_proto in ipairs(proto.nested_prototypes) do
          do_replace_or_overlay(nested_proto[2], table_merge(proto, { type = nested_proto[1] }), name)
        end
      end
      if proto.hooks then
        for _, hook in ipairs(proto.hooks) do
          hook(name, proto)
        end
      end
      proto.enabled = true
    end
  end
end
