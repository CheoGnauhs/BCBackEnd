json.array! @items do |item|
  json.(item, :name, :price, :created_at, :image, :description, :status)

  json.seller(item.seller, :handle, :credit)

  if @user
    json.collected(!!item.collections.where(user: @user).first)
  end
end