class AddNlsubtitleToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :subtitle, :string
  end
end
