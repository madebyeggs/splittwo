class AddPlatformToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :platform, :string
  end
end
