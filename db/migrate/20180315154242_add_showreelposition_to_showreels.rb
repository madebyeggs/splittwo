class AddShowreelpositionToShowreels < ActiveRecord::Migration
  def change
    add_column :showreels, :showreelposition, :integer
  end
end

