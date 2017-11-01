class AddFields2ToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :work_brand_name2, :string
    add_column :customs, :work_campaign_title2, :string
  end
end
