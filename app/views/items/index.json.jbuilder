json.array! @items do |item|
  json.(item, :name, :price, :created_at, :description, :status)

  json.seller(item.seller, :handle, :credit)

  json.image(url_for(item.cover))

  if @user
    json.collected(!!item.collections.where(user: @user).first)
  end
end