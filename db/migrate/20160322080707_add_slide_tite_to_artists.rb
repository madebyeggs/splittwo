class AddSlideTiteToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :slide_title, :string
  end
end
