class AddLowqualToCustoms < ActiveRecord::Migration
  def self.up
    add_attachment :customs, :lowqual
  end

  def self.down
    remove_attachment :customs, :lowqual
  end
end
