class AddDisplaypositionToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :Displayposition, :integer
  end
end
