class AddNewslettertitle2ToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :newslettertitle2, :text
  end
end
