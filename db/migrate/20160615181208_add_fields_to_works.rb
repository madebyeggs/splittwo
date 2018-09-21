class AddFieldsToWorks < ActiveRecord::Migration
  def change
    add_column :works, :slide_title2, :text
    add_column :works, :slide_title3, :text
  end
end
