json.array!(@item_data) do |item_datum|
  json.extract! item_datum, :id, :data, :item_id
  json.url item_datum_url(item_datum, format: :json)
end
