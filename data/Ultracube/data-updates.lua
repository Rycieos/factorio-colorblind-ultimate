require("scripts.config")
require("scripts.icons")
require("scripts.utils")

-- Compatability
-- Work around bug in Ultracube.
-- https://github.com/grandseiken/factorio-ultracube/pull/26
if config("coal") ~= Options.none then
  local source = data:get("item", "coal")
  local proto = data:get("item", "coal-ultralocomotion")
  if source and proto then
    replace_icons(proto, icons_from_obj(source))
  end
end

if config("nuclear-fuel") ~= Options.none then
  local source = data:get("item", "cube-nuclear-fuel")
  local proto = data:get("item", "cube-nuclear-fuel-ultralocomotion")
  if source and proto then
    replace_icons(proto, icons_from_obj(source))
  end
end
