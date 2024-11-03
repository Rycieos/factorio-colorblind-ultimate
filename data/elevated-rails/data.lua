require("scripts.config")

-- Chain signal
if
  config("rail-chain-signal-blue")
  or config("rail-chain-signal-green")
  or config("rail-chain-signal-red")
  or config("rail-chain-signal-yellow")
then
  local prototype = data:get("rail-chain-signal", "rail-chain-signal")
  if prototype then
    local stripe = {
      filename = SpritePath .. "rail-chain-signal/elevated-rail-chain-signal.png",
      width_in_frames = 1,
    }
    local animation = prototype.elevated_picture_set.structure
    local sprite_sheet = table.deepcopy(animation.layers[1])

    sprite_sheet.stripes = {
      config("rail-chain-signal-red") and table_merge(stripe, { x = 126 }) or stripe,
      config("rail-chain-signal-yellow") and table_merge(stripe, { x = 252 }) or stripe,
      config("rail-chain-signal-green") and table_merge(stripe, { x = 378 }) or stripe,
      config("rail-chain-signal-blue") and table_merge(stripe, { x = 504 }) or stripe,
    }

    table.insert(animation.layers, sprite_sheet)
  end
end
