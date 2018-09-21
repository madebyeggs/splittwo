class AddNewsletterToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :newsletter, :boolean
  end
end
