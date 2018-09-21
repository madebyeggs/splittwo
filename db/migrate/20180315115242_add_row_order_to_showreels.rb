class AddRowOrderToShowreels < ActiveRecord::Migration
  def change
    add_column :showreels, :row_order, :integer
  end
end
