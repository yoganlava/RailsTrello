json.extract! board_access, :id, :user_id, :board_id, :created_at, :updated_at
json.url board_access_url(board_access, format: :json)
