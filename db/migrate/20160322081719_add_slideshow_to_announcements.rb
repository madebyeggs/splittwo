class AddSlideshowToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :slideshow, :boolean
  end
end
