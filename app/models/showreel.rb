class Showreel < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :work_campaign_title, use: :slugged
  include RankedModel
  ranks :row_order
  
end