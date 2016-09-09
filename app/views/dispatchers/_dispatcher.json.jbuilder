json.extract! dispatcher, :id, :firstname, :lastname, :username, :on_shift, :destination_id, :created_at, :updated_at
json.url dispatcher_url(dispatcher, format: :json)