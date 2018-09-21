class AddSlideshowpositionToWorks < ActiveRecord::Migration
  def change
    add_column :works, :Slideshowposition, :integer
  end
end
