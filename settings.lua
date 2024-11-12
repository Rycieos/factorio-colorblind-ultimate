require("scripts.utils")

function add_bool_setting(name, localised_name, localised_description)
  data:extend({
    {
      name = config_name(name),
      type = "bool-setting",
      setting_type = "startup",
      default_value = false,
      order = order_prefix .. "b" .. name .. "b",
      localised_name = localised_name or { "item-name." .. name },
      localised_description = localised_description or { "colorblind_ultimate-description.custom-overlay" },
    },
  })
end

function add_option_setting(name, localised_name, options)
  data:extend({
    {
      name = config_name(name),
      type = "string-setting",
      setting_type = "startup",
      default_value = Options.none,
      allowed_values = { Options.none, table.unpack(options) },
      order = order_prefix .. "b" .. name .. "d",
      localised_name = localised_name,
      localised_description = { "colorblind_ultimate-description.custom-overlay-all" },
    },
  })
end

function add_color_setting(name, localised_name, default)
  data:extend({
    {
      name = config_name(name .. "-color"),
      type = "color-setting",
      setting_type = "startup",
      default_value = default,
      order = order_prefix .. "a",
      localised_name = localised_name,
    },
  })
end

function add_map_color_setting(name, default, localised_name)
  data:extend({
    {
      name = config_name(name .. "-map-color"),
      type = "color-setting",
      setting_type = "startup",
      default_value = default,
      order = order_prefix .. "b" .. name .. "e",
      localised_name = { "", localised_name or { "entity-name." .. name }, " ", { "colorblind_ultimate-word.on-map" } },
    },
  })
end

function settings_from_prototypes(prototypes)
  for name, proto in pairs(prototypes) do
    if not proto.config_from then
      local allowed_values = {}
      local is_entity = proto.is_entity or proto.sprite_replacement
      local localised_name = proto.localised_name or { ((is_entity and "entity" or "item") .. "-name." .. name) }
      if proto.icon_replacement then
        add_bool_setting(
          name .. "-icon-replacement",
          { "", localised_name, ": ", { "colorblind_ultimate-description.icon-replacement" } },
          { "colorblind_ultimate-description.custom-icon" }
        )
      end
      if proto.sprite_replacement then
        add_bool_setting(
          name .. "-sprite-replacement",
          { "", localised_name, ": ", { "colorblind_ultimate-description.sprite-replacement" } },
          { "colorblind_ultimate-description.custom-sprite" }
        )
      end
      if proto.icon_overlay or proto.icon_overlay_from then
        if proto.icon_overlay and string.sub(proto.icon_overlay, 1, 5) == "tier-" then
          table.insert(allowed_values, Options.tier)
        else
          table.insert(allowed_values, Options.icon_overlay)
        end
      end
      if proto.text_overlay then
        table.insert(allowed_values, Options.text_overlay)
      end

      if next(allowed_values) ~= nil then
        add_option_setting(
          name .. "-icon-overlay",
          { "", localised_name, ": ", { "colorblind_ultimate-description.icon-overlay" } },
          allowed_values
        )
        if is_entity then
          add_option_setting(
            name .. "-sprite-overlay",
            { "", localised_name, ": ", { "colorblind_ultimate-description.sprite-overlay" } },
            allowed_values
          )
        end
      end
    end
  end
end

order_prefix = "ac"
require("data.core.settings")

for mod, mod_stages in pairs(Mods) do
  if mods[mod] and mod_stages.settings then
    order_prefix = mod_stages.order
    require("data." .. mod .. ".settings")
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
    localised_name = { "", { "gui-blueprint.icon" }, " ", { "gui-map-generator.scale" } },
  },
  {
    name = config_name("overlay-corner"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "upper-left",
    allowed_values = keys(Offsets),
    order = "ab",
  },
  {
    name = config_name("secondary-overlay-corner"),
    type = "string-setting",
    setting_type = "startup",
    default_value = "upper-right",
    allowed_values = keys(Offsets),
    order = "ab",
  },
})
