local allowed_values = {"none", "text-overlay", "molecule", "molecule-overlay"}

data:extend({
  {
    name = "colorblind_ultimate__scale",
    type = "double-setting",
    setting_type = "startup",
    default_value = 0.5,
    minimum_value = 0.1,
    maximum_value = 1.0,
    order = "100",
    localised_name = "Icon scale",
    localised_description = "scale for icon overlays",
  },
  {
    name = "colorblind_ultimate__electronic-circuit-custom",
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "100",
    localised_name = "Electronic circuit custom",
    localised_description = "custom icon",
  },
  {
    name = "colorblind_ultimate__copper-plate-custom",
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = "100",
    localised_name = "Copper plate custom",
    localised_description = "custom icon",
  },
  {
    name = "colorblind_ultimate__heavy-oil-custom",
    type = "string-setting",
    setting_type = "startup",
    default_value = "none",
    order = "100",
    localised_name = "Heavy oil custom",
    localised_description = "custom icon",
    allowed_values = allowed_values,
  },
  {
    name = "colorblind_ultimate__light-oil-custom",
    type = "string-setting",
    setting_type = "startup",
    default_value = "none",
    order = "100",
    localised_name = "Light oil custom",
    localised_description = "custom icon",
    allowed_values = allowed_values,
  },
  {
    name = "colorblind_ultimate__water-custom",
    type = "string-setting",
    setting_type = "startup",
    default_value = "none",
    order = "100",
    localised_name = "Water custom",
    localised_description = "custom icon",
    allowed_values = allowed_values,
  },
})

