class AddFieldsToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :slide_title2, :text
    add_column :releases, :slide_title3, :text
  end
end
