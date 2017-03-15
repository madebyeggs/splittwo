class AddFullqualToCustoms < ActiveRecord::Migration
  def self.up
    add_attachment :customs, :fullqual
  end

  def self.down
    remove_attachment :customs, :fullqual
  end
end
