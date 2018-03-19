class Custom < ActiveRecord::Base
  
  has_many :customvideos
  
  before_save { |custom| if custom.lowqual_changed? then custom.lowqual = custom.lowqual.sub! 'dl=0', 'dl=1' end }
  before_save { |custom| if custom.fullqual_changed? then custom.fullqual = custom.fullqual.sub! 'dl=0', 'dl=1' end }
  before_save { |custom|
    if custom.soundcloud_changed? then
      input_string = custom.soundcloud.gsub(/\s+/, "").to_s
      str1_markerstring = "playlists/"
      str2_markerstring = "&color"
      input_string_chop = input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
      custom.soundcloud = input_string_chop
    end
  }
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  include RankedModel
  ranks :row_order
  
  if Rails.env.development?
    has_attached_file :image, CUSTOM_IMAGE_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :image,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '555x370>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "customs/images/:id_partition/:style/:filename"
  end
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end