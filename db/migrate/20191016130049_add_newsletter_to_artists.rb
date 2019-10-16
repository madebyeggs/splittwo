class AddNewsletterToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :newsletter, :boolean
  end
end
