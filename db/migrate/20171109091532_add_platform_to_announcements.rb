class AddPlatformToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :platform, :string
  end
end
