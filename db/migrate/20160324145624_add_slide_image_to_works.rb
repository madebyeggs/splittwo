class AddSlideImageToWorks < ActiveRecord::Migration
  def self.up
    add_attachment :works, :slide_image
  end

  def self.down
    remove_attachment :works, :slide_image
  end
end
