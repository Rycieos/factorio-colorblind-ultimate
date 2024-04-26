local handler = require("event_handler")

local on_player_created = function(event)
  local player = game.players[event.player_index]
  local character = player.character
  player.character = nil
  if character then
    character.destroy()
  end

  local r = global.chart_distance or 200
  player.force.chart(player.surface, {{player.position.x - r, player.position.y - r}, {player.position.x + r, player.position.y + r}})

  player.cheat_mode = true
  player.surface.always_day = true
  player.clear_recipe_notifications()

  if game.is_multiplayer() then
    player.print({"msg-alt-warning"})
  else
    game.show_message_dialog{text = {"msg-alt-warning"}}
  end
end

handler.add_lib({
  events = {
    [defines.events.on_player_created] = on_player_created
  }
})
