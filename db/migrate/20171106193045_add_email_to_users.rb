class AddEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_index :users, :email, unique: true
    add_column :users, :admin, :boolean, default: false
  end
end
