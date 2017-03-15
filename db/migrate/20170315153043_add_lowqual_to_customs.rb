class AddLowqualToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :fullqual, :text
  end
end
