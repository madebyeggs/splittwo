class Research < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  include RankedModel
  ranks :row_order
  
  if Rails.env.development?
    has_attached_file :image, RESEARCH_IMAGE_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :image,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '1680x915>', thumb: '350X191'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "researches/images/:id_partition/:style/:filename"
  end
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end