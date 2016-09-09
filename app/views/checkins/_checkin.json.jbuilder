json.extract! checkin, :id, :checkout, :destination_id, :skier_id, :created_at, :updated_at
json.url checkin_url(checkin, format: :json)