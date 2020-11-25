class AddArtistToReleases < ActiveRecord::Migration
  def change
    add_reference :releases, :artist, index: true, foreign_key: true
  end
end
