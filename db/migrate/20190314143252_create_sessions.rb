class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.datetime :expire_at
      t.string :token
      t.string :ip

      t.timestamps
    end

    add_index :sessions, :user_id
    add_index :sessions, :token
  end
end
