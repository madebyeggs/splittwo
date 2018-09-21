class AddSlugToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :slug, :string
    add_index :announcements, :slug, unique: true
  end
end
