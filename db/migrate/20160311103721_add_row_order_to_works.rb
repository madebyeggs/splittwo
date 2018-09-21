class AddRowOrderToWorks < ActiveRecord::Migration
  def change
    add_column :works, :row_order, :integer
  end
end
