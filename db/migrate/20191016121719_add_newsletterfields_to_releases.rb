class AddNewsletterfieldsToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :nltitle, :string
    add_column :releases, :nlsubtitle, :string
  end
end
