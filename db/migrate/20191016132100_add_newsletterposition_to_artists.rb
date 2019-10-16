class AddNewsletterpositionToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :newsletterposition, :integer
  end
end
