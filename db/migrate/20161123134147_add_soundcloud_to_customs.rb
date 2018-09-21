class AddSoundcloudToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :soundcloud, :string
  end
end
