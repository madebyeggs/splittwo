class Customvid < ActiveRecord::Base
  belongs_to :custom
  accepts_nested_attributes_for :custom
end
