class AddSlideTitleToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :slide_title, :text
  end
end
