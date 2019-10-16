class AddNldescriptionToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :nldescription, :text
    add_column :artists, :nltitle, :string
    add_column :artists, :nltitle2, :string
  end
end
