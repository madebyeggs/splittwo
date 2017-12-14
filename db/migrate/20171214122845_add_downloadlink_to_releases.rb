class AddDownloadlinkToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :downloadlink, :string
  end
end
