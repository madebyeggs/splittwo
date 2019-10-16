class AddNldescriptionToWorks < ActiveRecord::Migration
  def change
    add_column :works, :nldescription, :text
  end
end
