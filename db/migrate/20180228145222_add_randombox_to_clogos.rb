class AddRandomboxToClogos < ActiveRecord::Migration
  def change
    add_column :clogos, :randombox, :boolean
  end
end
