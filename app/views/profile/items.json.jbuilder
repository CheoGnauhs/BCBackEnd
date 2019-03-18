json.array! @items do |item|
  json.(item, :name, :price, :created_at, :description, :status, :id, :district)

  json.field(item.tags.pluck(:name))

  json.image(url_for(item.cover))
end