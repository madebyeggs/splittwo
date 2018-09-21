class AddSlideImageToReleases < ActiveRecord::Migration
  def self.up
    add_attachment :releases, :slide_image
  end

  def self.down
    remove_attachment :releases, :slide_image
  end
end
