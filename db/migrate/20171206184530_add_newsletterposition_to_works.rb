class AddNewsletterpositionToWorks < ActiveRecord::Migration
  def change
    add_column :works, :newsletterposition, :integer
  end
end
