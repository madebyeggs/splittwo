class AddImageToResearches < ActiveRecord::Migration
  def self.up
    add_attachment :researches, :image
  end

  def self.down
    remove_attachment :researches, :image
  end
end
