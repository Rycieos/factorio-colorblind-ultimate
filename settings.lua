require("scripts.utils")

function add_replace_setting(name, localised_name)
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "b",
    localised_name = localised_name or {"item-name." .. name},
    localised_description = "a custom icon",
  }})
end

function add_overlay_setting(name, localised_name)
  data:extend({{
    name = config_name(name),
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "c",
    localised_name = localised_name or {"item-name." .. name},
    localised_description = "a custom overlay",
  }})
end

function add_option_setting(name, localised_name, options)
  data:extend({{
    name = config_name(name),
    type = "string-setting",
    setting_type = "startup",
    default_value = Options.none,
    allowed_values = {Options.none, table.unpack(options)},
    order = "d",
    localised_name = localised_name,
    localised_description = "a custom icon, overlay, or text overlay",
  }})
end

function settings_from_prototypes(prototypes)
  for name, proto in pairs(prototypes) do
    local allowed_values = {}
    local is_entity = proto.is_entity or proto.sprite_replacement
    if proto.icon_replacement then
      table.insert(allowed_values, Options.icon)
      if proto.sprite_replacement then
        table.insert(allowed_values, Options.icon_and_entity)
      end
    end
    if proto.sprite_replacement then
      table.insert(allowed_values, Options.entity)
    end
    if proto.icon_overlay or proto.icon_overlay_from then
      if proto.icon_overlay and string.sub(proto.icon_overlay, 1, 5) == "tier-" then
        table.insert(allowed_values, Options.tier)
        if is_entity then
          table.insert(allowed_values, Options.tier_icon)
          table.insert(allowed_values, Options.tier_entity)
        end
      else
        table.insert(allowed_values, Options.icon_overlay)
        if is_entity then
          table.insert(allowed_values, Options.icon_overlay_icon)
          table.insert(allowed_values, Options.icon_overlay_entity)
        end
      end
    end
    if proto.text_overlay then
      table.insert(allowed_values, Options.text_overlay)
      if is_entity then
        table.insert(allowed_values, Options.text_overlay_icon)
        table.insert(allowed_values, Options.text_overlay_entity)
      end
    end

    add_option_setting(name,
      proto.localised_name or {((is_entity and "entity" or "item") .. "-name." .. name)},
      allowed_values
    )
  end
end

require("data.core.settings")

for _, mod in ipairs(Mods) do
  if mods[mod] then
    require("data."..mod..".settings")
  end
end

data:extend({
  {
    name = config_name("scale"),
    type = "double-setting",
    setting_type = "startup",
    default_value = 0.5,
    minimum_value = 0.1,
    maximum_value = 1.0,
    order = "aa",
    localised_name = "Icon scale",
    localised_description = "scaling for icons overlaid the base icon",
  },
  {
    name = config_name("overlay-corner"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "lower-left",
    allowed_values = keys(Offsets),
    order = "ab",
    localised_name = "Overlay location",
  },
  {
    name = config_name("secondary-overlay-corner"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "upper-left",
    allowed_values = keys(Offsets),
    order = "ab",
    localised_name = "Secondary overlay location",
    localised_description = "for icons that need more than one overlay",
  },
})
