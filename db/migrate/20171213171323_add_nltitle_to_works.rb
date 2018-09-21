class AddNltitleToWorks < ActiveRecord::Migration
  def change
    add_column :works, :nltitle, :string
    add_column :works, :nlsubtitle, :string
  end
end
