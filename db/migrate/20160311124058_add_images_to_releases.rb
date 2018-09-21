class AddImagesToReleases < ActiveRecord::Migration
  def self.up
    add_attachment :releases, :image
    add_attachment :releases, :fb_image
  end

  def self.down
    remove_attachment :releases, :image
    remove_attachment :releases, :fb_image
  end
end
