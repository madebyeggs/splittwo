class AddDisplayToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :display, :boolean
  end
end
