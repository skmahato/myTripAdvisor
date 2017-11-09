class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|

      t.integer "user_id"
      t.integer "hotel_id"
      t.integer "rating"

      t.timestamps
    end

    add_index :ratings, :user_id
    add_index :ratings, :hotel_id

  end
end
