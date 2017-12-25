class AddUserIdToTables < ActiveRecord::Migration[5.1]
  def change

    add_column :bookings, :user_id, :integer
    add_column :reviews, :user_id, :integer
    add_column :comments, :user_id, :integer
    add_index :bookings, :user_id
    add_index :reviews, :user_id
    add_index :comments, :user_id


  end
end
