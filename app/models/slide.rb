class Slide < ActiveRecord::Base
  
  extend FriendlyId
  include RankedModel
  ranks :row_order
  
  has_many :announcements, -> { where slideshow: true }
  has_many :artists, -> { where slideshow: true }
  
end
