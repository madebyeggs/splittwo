class AddTracknameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :track_name, :string
  end
end
