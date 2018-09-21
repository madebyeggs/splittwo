class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :title1
      t.string :title2
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :website
      t.timestamps null: false
    end
  end
end
