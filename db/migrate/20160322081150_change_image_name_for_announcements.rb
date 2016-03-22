class ChangeImageNameForAnnouncements < ActiveRecord::Migration
  def self.up
    rename_column :announcements, :image_file_name, :slide_image_file_name
    rename_column :announcements, :image_file_size, :slide_image_file_size
    rename_column :announcements, :image_content_type, :slide_image_content_type
    rename_column :announcements, :image_updated_at, :slide_image_updated_at       
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
