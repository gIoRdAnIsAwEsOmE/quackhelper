json.extract! event, :id, :start_time, :assignment, :subject, :created_at, :updated_at
json.url event_url(event, format: :json)
