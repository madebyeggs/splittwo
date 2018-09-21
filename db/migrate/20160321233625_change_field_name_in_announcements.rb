class ChangeFieldNameInAnnouncements < ActiveRecord::Migration
  def change
    change_table :announcements do |t|
      t.rename :homepage_titl, :homepage_title
    end
  end
end
