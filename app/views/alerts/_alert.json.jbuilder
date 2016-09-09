json.extract! alert, :id, :false_alarm, :user_generated, :state, :dispatcher_id, :patroller_id, :ping_id, :created_at, :updated_at
json.url alert_url(alert, format: :json)