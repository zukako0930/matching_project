json.extract! match_request, :id, :request_user_id, :integer, :target_user_id, :integer, :created_at, :updated_at
json.url match_request_url(match_request, format: :json)
