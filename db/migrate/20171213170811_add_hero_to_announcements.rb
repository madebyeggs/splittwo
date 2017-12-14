class AddHeroToAnnouncements < ActiveRecord::Migration
  def self.up
    add_attachment :announcements, :hero
  end

  def self.down
    remove_attachment :announcements, :hero
  end
end
