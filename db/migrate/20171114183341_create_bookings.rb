class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer "hotel_id"
      t.datetime "check_in"
      t.datetime "check_out"

      t.timestamps
    end


    add_index :bookings, :hotel_id

  end
end
