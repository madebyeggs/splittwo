class AddSlideImageToArtists < ActiveRecord::Migration
  def self.up
    add_attachment :artists, :slide_image
  end

  def self.down
    remove_attachment :artists, :slide_image
  end
end
