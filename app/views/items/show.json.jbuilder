json.(@item, :id, :name, :price, :created_at, :description, :status, :district, :fineness, :method, :field)

json.seller(@item.seller, :handle, :credit)

json.image(url_for(@item.cover))

if @user
  json.collected(!!@item.collections.where(user: @user).first)
end