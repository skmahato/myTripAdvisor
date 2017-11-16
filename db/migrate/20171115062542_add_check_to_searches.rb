class AddCheckToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :check_in, :datetime
    add_column :searches, :check_out, :datetime
  end
end
