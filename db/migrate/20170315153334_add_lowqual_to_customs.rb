class AddLowqualToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :lowqual, :text
  end
end
