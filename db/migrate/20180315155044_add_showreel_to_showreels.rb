class AddShowreelToShowreels < ActiveRecord::Migration
  def change
    add_column :showreels, :showreel, :boolean
  end
end

