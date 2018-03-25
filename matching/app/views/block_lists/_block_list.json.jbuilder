json.extract! block_list, :id, :blocked_by, :blocked, :created_at, :updated_at
json.url block_list_url(block_list, format: :json)
