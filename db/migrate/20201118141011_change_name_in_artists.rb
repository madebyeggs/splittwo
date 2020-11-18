class ChangeNameInArtists < ActiveRecord::Migration
  def change
    rename_column :artists, :name, :artist_name
  end
end
