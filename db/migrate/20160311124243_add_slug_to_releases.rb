class AddSlugToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :slug, :string
    add_index :releases, :slug, unique: true
  end
end
