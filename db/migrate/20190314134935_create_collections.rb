class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :comment

      t.timestamps
    end

    add_index :collections, %i[user_id item_id], unique: true
  end
end
