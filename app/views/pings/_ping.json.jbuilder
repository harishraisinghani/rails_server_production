json.extract! ping, :id, :lat, :long, :checkin_id, :created_at, :updated_at
json.url ping_url(ping, format: :json)