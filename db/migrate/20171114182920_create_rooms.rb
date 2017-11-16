class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|

      t.integer "hotel_id"
      t.integer "room_no"

      t.timestamps
    end

    add_index :rooms, :hotel_id

  end
end
