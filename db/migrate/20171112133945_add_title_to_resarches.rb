class AddTitleToResarches < ActiveRecord::Migration
  def change
    add_column :researches, :title, :string
  end
end
