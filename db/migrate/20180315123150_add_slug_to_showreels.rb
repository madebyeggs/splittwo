class AddSlugToShowreels < ActiveRecord::Migration
  def change
    add_column :showreels, :slug, :string
    add_index :showreels, :slug, unique: true
  end
end