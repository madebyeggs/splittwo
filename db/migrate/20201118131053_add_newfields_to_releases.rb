class AddNewfieldsToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :track_name, :string
    add_column :releases, :artist_name, :string
  end
end
