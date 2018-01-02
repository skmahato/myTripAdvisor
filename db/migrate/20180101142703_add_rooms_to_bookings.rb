class AddRoomsToBookings < ActiveRecord::Migration[5.1]
  def change

    add_column :bookings, :no_of_guests, :integer
    add_column :bookings, :no_of_rooms, :integer


  end
end
