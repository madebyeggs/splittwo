class AddRowOrderToResearches < ActiveRecord::Migration
  def change
    add_column :researches, :row_order, :integer
  end
end
