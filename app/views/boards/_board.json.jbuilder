json.extract! board, :id, :name, :creator, :private, :custom_url, :created_at, :updated_at
json.url board_url(board, format: :json)
