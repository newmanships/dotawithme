json.array!(@players) do |player|
  json.extract! player, :one, :two, :three, :four, :five, :rank, :language, :location, :playerSteamID, :username
  json.url player_url(player, format: :json)
end
