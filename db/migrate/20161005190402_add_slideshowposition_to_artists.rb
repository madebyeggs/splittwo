class AddSlideshowpositionToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :Slideshowposition, :integer
  end
end
