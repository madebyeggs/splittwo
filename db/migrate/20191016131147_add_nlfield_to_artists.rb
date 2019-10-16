class AddNlfieldToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :nlsubtitle, :string
  end
end
