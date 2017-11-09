class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer "hotel_id"
      t.integer "user_id"
      t.string "image_name"
      t.string "content_type"
      t.integer "file_size"

      t.timestamps
    end
  end
end
