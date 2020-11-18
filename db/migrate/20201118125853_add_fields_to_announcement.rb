class AddFieldsToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :artist_name, :string
    add_column :announcements, :track_name, :string
  end
end
