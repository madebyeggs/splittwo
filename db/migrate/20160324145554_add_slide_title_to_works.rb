class AddSlideTitleToWorks < ActiveRecord::Migration
  def change
    add_column :works, :slide_title, :text
  end
end
