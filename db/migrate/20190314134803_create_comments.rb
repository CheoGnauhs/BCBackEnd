class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :content
      t.integer :thread_id, null: true

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :item_id
    add_index :comments, :thread_id
  end
end
