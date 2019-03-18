class AddReceiverInformationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address, :string
    add_column :orders, :telephone, :string
  end
end
