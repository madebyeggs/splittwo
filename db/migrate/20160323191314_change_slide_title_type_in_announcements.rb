class ChangeSlideTitleTypeInAnnouncements < ActiveRecord::Migration
  def self.up
    change_column :announcements, :slide_title, :text
  end

  def self.down
    change_column :announcements, :slide_title, :string
  end
end
