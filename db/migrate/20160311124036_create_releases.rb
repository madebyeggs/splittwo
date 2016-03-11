class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.string :soundcloud
      t.text :description

      t.timestamps null: false
    end
  end
end
