class AddApprovedByToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :approved_by, :boolean, default: false
    add_column :comments, :approved_by, :boolean, default: false
    add_column :ratings, :approved_by, :boolean, default: false
  end
end
