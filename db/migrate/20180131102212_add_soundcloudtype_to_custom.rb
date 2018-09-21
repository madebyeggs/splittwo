class AddSoundcloudtypeToCustom < ActiveRecord::Migration
  def change
    add_column :customs, :souncloudtype, :string
  end
end
