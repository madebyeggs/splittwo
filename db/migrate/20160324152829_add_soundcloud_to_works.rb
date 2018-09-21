class AddSoundcloudToWorks < ActiveRecord::Migration
  def change
    add_column :works, :soundcloud, :string
  end
end
