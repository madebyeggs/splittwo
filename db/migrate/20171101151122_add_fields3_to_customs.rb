class AddFields3ToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :work_brand_name3, :string
    add_column :customs, :work_campaign_title3, :string
  end
end
