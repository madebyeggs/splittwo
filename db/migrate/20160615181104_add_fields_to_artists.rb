class AddFieldsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :slide_title2, :text
    add_column :artists, :slide_title3, :text
  end
end
