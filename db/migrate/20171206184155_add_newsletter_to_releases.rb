class AddNewsletterToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :newsletter, :boolean
  end
end
