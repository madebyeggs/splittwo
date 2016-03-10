class AddFbImageToArtists < ActiveRecord::Migration
  def self.up
    add_attachment :artists, :fb_image
  end

  def self.down
    remove_attachment :artists, :fb_image
  end
end