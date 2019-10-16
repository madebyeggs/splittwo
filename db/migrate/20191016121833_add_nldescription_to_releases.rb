class AddNldescriptionToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :nldescription, :text
  end
end
