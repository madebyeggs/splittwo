class AddHeroToWorks < ActiveRecord::Migration
  def self.up
    add_attachment :works, :hero
  end

  def self.down
    remove_attachment :works, :hero
  end
end
