class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :seller_id
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :status
      t.string :district
      t.integer :fineness
      t.integer :method
      t.integer :field

      t.timestamps
    end

    add_index :items, :seller_id
  end
end
