class AddImageToClogos < ActiveRecord::Migration
  def self.up
    add_attachment :clogos, :image
  end

  def self.down
    remove_attachment :clogos, :image
  end
end
