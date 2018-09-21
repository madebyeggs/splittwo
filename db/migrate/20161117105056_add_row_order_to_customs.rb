class AddRowOrderToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :row_order, :integer
  end
end
