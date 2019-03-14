class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :status
      t.string :express_number
      t.integer :item_id

      t.timestamps
    end

    add_index :orders, :buyer_id
    add_index :orders, :item_id
  end
end
