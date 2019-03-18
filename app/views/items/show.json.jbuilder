json.(@item, :id, :name, :price, :created_at, :description, :status, :district, :fineness, :method)

json.seller do
  json.(@item.seller, :handle, :credit, :balance, :district, :avatar, :email)
  json.total_items(@item.seller.items.count)
end

json.image(url_for(@item.cover))

json.field(@item.tags.pluck(:name))

if @user
  json.collected(!!@item.collections.where(user: @user).first)
end