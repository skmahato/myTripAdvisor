class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.integer "review_id"
      t.text "comment"

      t.timestamps
    end

    add_index :comments, :review_id

  end
end
