json.(@item, :id, :name, :price, :created_at, :description, :status, :district, :fineness, :method)

json.seller(@item.seller, :handle, :credit)

json.image(url_for(@item.cover))

json.field(@item.tags.pluck(:name))

if @user
  json.collected(!!@item.collections.where(user: @user).first)
end