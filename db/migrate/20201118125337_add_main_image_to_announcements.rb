class AddMainImageToAnnouncements < ActiveRecord::Migration
  def self.up
    add_attachment :announcements, :image
  end

  def self.down
    remove_attachment :announcements, :image
  end
end