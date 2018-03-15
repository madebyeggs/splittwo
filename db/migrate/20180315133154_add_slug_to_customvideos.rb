class AddSlugToCustomvideos < ActiveRecord::Migration
  def change
    add_column :customvideos, :slug, :string
    add_index :customvideos, :slug, unique: true
  end
end