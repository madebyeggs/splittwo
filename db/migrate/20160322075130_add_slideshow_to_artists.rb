class AddSlideshowToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :slideshow, :boolean
  end
end
