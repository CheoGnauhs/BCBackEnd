json.array! @orders do |order|
  json.(order.item, :name, :price, :created_at, :description, :status, :id, :district)

  json.image(url_for(order.item.cover))
end