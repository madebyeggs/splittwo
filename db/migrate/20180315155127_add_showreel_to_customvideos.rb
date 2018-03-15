class AddShowreelToCustomvideos < ActiveRecord::Migration
  def change
    add_column :customvideos, :showreel, :boolean
  end
end

