class AddFieldsToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :work_brand_name, :string
    add_column :customs, :work_campaign_title, :string
  end
end
