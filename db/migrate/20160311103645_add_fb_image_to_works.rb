class AddFbImageToWorks < ActiveRecord::Migration
  def self.up
    add_attachment :works, :fb_image
  end

  def self.down
    remove_attachment :works, :fb_image
  end
end
