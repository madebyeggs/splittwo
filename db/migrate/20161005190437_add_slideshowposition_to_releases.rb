class AddSlideshowpositionToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :Slideshowposition, :integer
  end
end
