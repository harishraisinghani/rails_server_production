json.extract! destination, :id, :name, :lat, :long, :radius, :created_at, :updated_at
json.url destination_url(destination, format: :json)