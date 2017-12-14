class Newsletter < ActiveRecord::Base
  
  before_save { |newsletter| if newsletter.downloadlink_changed? then newsletter.downloadlink = newsletter.downloadlink.sub! 'dl=0', 'dl=1' end }
  
  if Rails.env.development?
    has_attached_file :logo, NEWSLETTER_LOGO_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :logo,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '250x250>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "newsletters/images/:id_partition/:style/:filename"
  end
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  
  if Rails.env.development?
    has_attached_file :mainimage, NEWSLETTER_MAIN_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :mainimage,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '312x312>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "newsletters/images/:id_partition/:style/:filename"
  end
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :mainimage, :content_type => /\Aimage\/.*\Z/
  
end