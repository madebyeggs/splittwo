class AddImageToArtists < ActiveRecord::Migration
  def self.up
    add_attachment :artists, :image
  end

  def self.down
    remove_attachment :artists, :image
  end
end