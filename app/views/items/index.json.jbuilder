json.array!(@items) do |item|
  json.extract! item, :id, :name, :item_type_id, :project_id
  json.url item_url(item, format: :json)
end
