class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :brand_name
      t.string :campaign_title
      t.string :agency
      t.string :track_name
      t.string :artist_name
      t.text :description
      t.string :vimeo

      t.timestamps null: false
    end
  end
end
