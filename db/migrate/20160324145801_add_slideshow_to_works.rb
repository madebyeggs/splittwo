class AddSlideshowToWorks < ActiveRecord::Migration
  def change
    add_column :works, :slideshow, :boolean
  end
end
