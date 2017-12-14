class AddNewsletterpositionToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :newsletterposition, :integer
  end
end
