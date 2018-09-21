class ChangeNamesInAnnouncements < ActiveRecord::Migration
  def change
    change_table :announcements do |t|
      t.rename :homepage_title, :slide_title
    end
  end
end
