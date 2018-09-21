class AddVimeoToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :vimeo, :string
  end
end
