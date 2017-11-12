class AddSlugToResearches < ActiveRecord::Migration
  def change
    add_column :researches, :slug, :string
    add_index :researches, :slug, unique: true
  end
end
