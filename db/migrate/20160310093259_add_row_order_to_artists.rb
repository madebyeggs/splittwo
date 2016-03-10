class AddRowOrderToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :row_order, :integer
  end
end
