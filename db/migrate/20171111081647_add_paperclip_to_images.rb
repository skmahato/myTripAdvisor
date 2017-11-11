class AddPaperclipToImages < ActiveRecord::Migration[5.1]
  def change
    remove_column("images", "image_name")
    remove_column("images", "content_type")
    remove_column("images", "file_size")
    add_attachment :images, :image
    add_index :images, :user_id
    add_index :images, :hotel_id
  end
end
