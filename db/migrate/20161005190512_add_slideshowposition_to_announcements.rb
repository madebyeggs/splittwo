class AddSlideshowpositionToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :Slideshowposition, :integer
  end
end
