class AddSlugToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :slug, :string
    add_index :customs, :slug, unique: true
  end
end
