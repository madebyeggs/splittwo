class AddGenreToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :genre, :string
  end
end
