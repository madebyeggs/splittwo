class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :homepage_titl
      t.string :vimeo
      t.text :description
      t.string :soundcloud
      t.timestamps null: false
    end
  end
end
