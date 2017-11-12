class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.integer "user_id"
      t.integer "hotel_id"
      t.text "mail"

      t.timestamps
    end

    add_index :emails, :user_id
    add_index :emails, :hotel_id
  end
end
