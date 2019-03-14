class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :handle
      t.string :password_digest
      t.string :email
      t.string :telephone
      t.string :location
      t.integer :credit, default: 0
      t.integer :balance, default: 0
      t.string :auth_token

      t.timestamps
    end

    add_index :users, :handle, unique: true
    add_index :users, :email, unique: true
    add_index :users, :telephone, unique: true
  end
end
