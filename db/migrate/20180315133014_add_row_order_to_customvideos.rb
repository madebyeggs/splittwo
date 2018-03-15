class AddRowOrderToCustomvideos < ActiveRecord::Migration
  def change
    add_column :customvideos, :row_order, :integer
  end
end