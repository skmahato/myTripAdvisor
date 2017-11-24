class AddGuestToRooms < ActiveRecord::Migration[5.1]
  def change

    add_column :rooms, :guest, :integer
    add_column :searches, :guest, :integer
    add_column :searches, :rating, :integer
  end
end
