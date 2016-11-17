class AddImageToCustoms < ActiveRecord::Migration
  def self.up
    add_attachment :customs, :image
  end

  def self.down
    remove_attachment :customs, :image
  end
end
