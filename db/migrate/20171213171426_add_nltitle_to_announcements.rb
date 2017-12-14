class AddNltitleToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :nltitle, :string
    add_column :announcements, :nlsubtitle, :string
  end
end
