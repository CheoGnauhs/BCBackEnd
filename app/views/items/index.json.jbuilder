json.array! @items do |item|
  json.(item, :name, :price, :created_at, :image, :description)

  json.seller(item.seller, :handle, :credit)
end