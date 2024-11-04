require("scripts.utils")
require("data.core.utils")

require("circuit-connector-generated-definitions")

local circuit_connector_replacements = {}

do_if_color_setting("circuit_connector_red_light", function(color)
  circuit_connector_replacements.led_red = {}
  circuit_connector_replacements.led_red.belt = {
    source = belt_connector_template.led_red.filename,
    replacement = SpritePath .. "transport-belt/connector/ccm-belt-04d-LED-R.png",
    tint = color,
  }
  circuit_connector_replacements.led_red.inserter = {
    source = inserter_connector_template.led_red.filename,
    replacement = SpritePath .. "circuit-connector/ccm-inserter-01-LED-RG-sequence.png",
    tint = color,
  }
  circuit_connector_replacements.led_red.universal = {
    source = universal_connector_template.led_red.filename,
    replacement = SpritePath .. "circuit-connector/ccm-universal-04hi-RG-LED-sequence.png",
    tint = color,
  }
end)

do_if_color_setting("circuit_connector_green_light", function(color)
  circuit_connector_replacements.led_green = {}
  circuit_connector_replacements.led_green.belt = {
    source = belt_connector_template.led_green.filename,
    replacement = SpritePath .. "transport-belt/connector/ccm-belt-04e-LED-G.png",
    tint = color,
  }
  circuit_connector_replacements.led_green.inserter = {
    source = inserter_connector_template.led_green.filename,
    replacement = SpritePath .. "circuit-connector/ccm-inserter-01-LED-RG-sequence.png",
    tint = color,
  }
  circuit_connector_replacements.led_green.universal = {
    source = universal_connector_template.led_green.filename,
    replacement = SpritePath .. "circuit-connector/ccm-universal-04hi-RG-LED-sequence.png",
    tint = color,
  }
end)

do_if_color_setting("circuit_connector_blue_light", function(color)
  circuit_connector_replacements.led_blue = {}
  circuit_connector_replacements.led_blue.belt = {
    source = belt_connector_template.led_blue.filename,
    replacement = SpritePath .. "transport-belt/connector/ccm-belt-04c-LED-B.png",
    tint = color,
  }
  circuit_connector_replacements.led_blue.inserter = {
    source = inserter_connector_template.led_blue.filename,
    replacement = SpritePath .. "circuit-connector/ccm-inserter-01-LED-B-on-sequence.png",
    tint = color,
  }
  circuit_connector_replacements.led_blue.universal = {
    source = universal_connector_template.led_blue.filename,
    replacement = SpritePath .. "circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
    tint = color,
  }
  circuit_connector_replacements.led_blue_off = {}
  circuit_connector_replacements.led_blue_off.inserter = {
    source = inserter_connector_template.led_blue_off.filename,
    replacement = SpritePath .. "circuit-connector/ccm-inserter-01-LED-B-off-sequence.png",
    tint = color,
  }
  circuit_connector_replacements.led_blue_off.universal = {
    source = universal_connector_template.led_blue_off.filename,
    replacement = SpritePath .. "circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
    tint = color,
  }
end)

if next(circuit_connector_replacements) ~= nil then
  local function replace_circuit_connector_sprites(sprites)
    for _, light in pairs({ "led_blue", "led_blue_off", "led_red", "led_green" }) do
      if sprites[light] and circuit_connector_replacements[light] then
        for _, replacement in pairs(circuit_connector_replacements[light]) do
          if sprites[light].filename == replacement.source then
            sprites[light].filename = replacement.replacement
            sprites[light].tint = replacement.tint
          end
        end
      end
    end
  end

  for _, _type in pairs(data.raw) do
    for _, prototype in pairs(_type) do
      if prototype.circuit_connector then
        local sprites = prototype.circuit_connector.sprites
        if sprites then
          replace_circuit_connector_sprites(sprites)
        else
          for _, connector in pairs(prototype.circuit_connector) do
            local sprites = connector.sprites
            if sprites then
              replace_circuit_connector_sprites(sprites)
            end
          end
        end
      end
    end
  end
end
