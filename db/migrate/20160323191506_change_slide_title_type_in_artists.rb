class ChangeSlideTitleTypeInArtists < ActiveRecord::Migration
  def self.up
    change_column :artists, :slide_title, :text
  end

  def self.down
    change_column :artists, :slide_title, :string
  end
end
