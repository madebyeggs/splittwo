class AddNewslettertitleToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :newslettertitle, :text
  end
end
