json.array! @collections do |item|
  json.(item, :name, :price, :created_at, :description, :status, :id)

  json.image(url_for(item.cover))
end