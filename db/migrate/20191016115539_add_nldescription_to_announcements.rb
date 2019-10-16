class AddNldescriptionToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :nldescription, :text
  end
end
