class AddRowOrderToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :row_order, :integer
  end
end
