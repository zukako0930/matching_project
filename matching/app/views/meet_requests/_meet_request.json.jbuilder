json.extract! meet_request, :id, :request_user_id, :target_user_id, :created_at, :updated_at
json.url meet_request_url(meet_request, format: :json)
