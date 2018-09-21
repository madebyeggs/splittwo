class AddPlatformToCustom < ActiveRecord::Migration
  def change
    add_column :customs, :platform, :string
    add_column :customs, :platform2, :string
    add_column :customs, :platform3, :string
  end
end
