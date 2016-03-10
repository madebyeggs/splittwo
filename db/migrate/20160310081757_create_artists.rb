class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :soundcloud
      t.string :vimeo
      t.string :fb_url
      t.string :twitter_name
      t.timestamps null: false
    end
  end
end
