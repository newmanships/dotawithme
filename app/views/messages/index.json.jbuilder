json.array!(@messages) do |message|
  json.extract! message, :recipient, :from, :note
  json.url message_url(message, format: :json)
end
