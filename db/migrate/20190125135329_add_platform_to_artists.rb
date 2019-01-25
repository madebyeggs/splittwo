class AddPlatformToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :platform, :string
  end
end
