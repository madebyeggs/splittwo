class AddShowreelpositionToCustomvideos < ActiveRecord::Migration
  def change
    add_column :customvideos, :showreelposition, :integer
  end
end
