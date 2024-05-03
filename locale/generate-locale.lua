#!/usr/bin/env lua

require("scripts.utils")

-- Define Factorio settings stage API.
mods = {}
for _, mod in ipairs(Mods) do
  mods[mod] = true
end

data = {}
settings = {}
function data:extend(array)
  for _, setting in ipairs(array) do
    table.insert(settings, setting)
  end
end

require("settings")

for _, lang_file in pairs({ ... }) do
  local file = io.open(lang_file, "r")
  local strings = file:read("*all")
  file:close()

  local locale_strings = {}
  for string in strings:gmatch("[^\r\n]+") do
    local key, value = string:match("([^=]+)=(.+)")
    locale_strings[key] = value
  end

  file = io.open(lang_file, "w")
  file:write("[string-mod-setting]\n")

  for _, setting in ipairs(settings) do
    if setting.type == "string-setting" and setting.allowed_values then
      for _, allowed_value in ipairs(setting.allowed_values) do
        local value = locale_strings[allowed_value]
        if value then
          file:write(setting.name .. "-" .. allowed_value .. "=" .. value .. "\n")
        end
      end
    end
  end
  file:close()
end
