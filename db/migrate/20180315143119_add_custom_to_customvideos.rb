class AddCustomToCustomvideos < ActiveRecord::Migration
  def change
    add_reference :customvideos, :custom, index: true, foreign_key: true
  end
end
