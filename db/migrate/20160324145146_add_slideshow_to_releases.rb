class AddSlideshowToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :slideshow, :boolean
  end
end
