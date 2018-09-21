class CreateCustomvideos < ActiveRecord::Migration
  def change
    create_table :customvideos do |t|
      t.text :description
      t.string :work_brand_name
      t.string :work_campaign_title
      t.string :platform
      t.string :vimeo
      t.timestamps null: false
    end
  end
end
