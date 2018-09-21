class AddRandomboxToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :randombox, :boolean
  end
end
