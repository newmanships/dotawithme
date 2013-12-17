json.array!(@teams) do |team|
  json.extract! team, :name, :rank, :description, :location, :language, :defaultMessage, :leaderSteamID
  json.url team_url(team, format: :json)
end
