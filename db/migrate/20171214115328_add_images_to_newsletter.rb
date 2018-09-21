class AddImagesToNewsletter < ActiveRecord::Migration
  def self.up
    add_attachment :newsletters, :logo
    add_attachment :newsletters, :mainimage
  end

  def self.down
    remove_attachment :newsletters, :logo
    remove_attachment :newsletters, :mainimage
  end
end
