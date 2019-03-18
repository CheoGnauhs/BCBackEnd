json.array! @orders do |order|
  json.(order.item, :name, :price, :created_at, :description, :id, :district)
  json.status(order.status)
  json.order_id(order.id)

  json.image(url_for(order.item.cover))
end