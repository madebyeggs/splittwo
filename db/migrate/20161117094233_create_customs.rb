class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :name
      t.text :description
      t.string :vimeo_1
      t.string :vimeo_2
      t.string :vimeo_3
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
