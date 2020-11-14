json.extract! card, :id, :parent_id, :name, :completed, :description, :priority, :due_date, :created_at, :updated_at
json.url card_url(card, format: :json)
