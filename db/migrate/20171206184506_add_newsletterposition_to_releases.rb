class AddNewsletterpositionToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :newsletterposition, :integer
  end
end
