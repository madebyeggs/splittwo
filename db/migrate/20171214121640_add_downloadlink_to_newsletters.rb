class AddDownloadlinkToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :downloadlink, :string
  end
end
