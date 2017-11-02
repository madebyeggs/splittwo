class CreateCustomvids < ActiveRecord::Migration
  def change
    create_table :customvids do |t|
      t.string :vimeo_id
      t.string :brand_name
      t.string :campaign_title
      t.belongs_to :custom, index: true
      t.timestamps null: false
    end
  end
end
