json.extract! message, :id, :body, :send_user_id, :receive_user_id, :created_at, :updated_at
json.url message_url(message, format: :json)
