class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|

      t.string "hotel_name"
      t.string "location"
      t.integer "price"
      t.string "email", :default=> ''

      t.timestamps
    end
  end
end
