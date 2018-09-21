class AddFieldsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :slide_title2, :text
    add_column :announcements, :slide_title3, :text
  end
end
