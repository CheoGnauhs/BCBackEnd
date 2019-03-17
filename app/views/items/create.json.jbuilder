json.(@item, :id, :name, :price, :created_at, :description, :status)

json.seller(@item.seller, :handle, :credit)

json.image(url_for(@item.cover))