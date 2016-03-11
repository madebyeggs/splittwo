class AddRowOrderToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :row_order, :integer
  end
end
