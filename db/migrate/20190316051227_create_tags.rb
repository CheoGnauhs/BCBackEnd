class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :tags_items do |t|
      t.integer :item_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :tags_items, :item_id
    add_index :tags_items, :tag_id
  end
end
