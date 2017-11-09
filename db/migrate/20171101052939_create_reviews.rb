class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|

      t.integer "hotel_id"
      t.text "review"

      t.timestamps
    end

    add_index :reviews, :hotel_id

  end
end
