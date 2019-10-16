class Release < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  include Filterable
  
  before_save { |release|
    if release.soundcloud_changed? then
      input_string = release.soundcloud.gsub(/\s+/, "").to_s
      str1_markerstring = "playlists/"
      str2_markerstring = "&color"
      input_string_chop = input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
      release.soundcloud = input_string_chop
    end
  }
  before_save { |release| if release.downloadlink_changed? then release.downloadlink = release.downloadlink.sub! 'dl=0', 'dl=1' end }
  
  require 'csv'
  
  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      release = Release.find_or_initialize_by(title: row["title"])
      release.assign_attributes(row.to_hash)
      release.save!
    end
  end
  
  include RankedModel
  ranks :row_order
  
  if Rails.env.development?
    has_attached_file :image, IMAGE_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :image,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '300x300>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "releases/images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  if Rails.env.development?
    has_attached_file :hero, HERO_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :hero,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '1115x952>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "releases/slide_images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :hero, :content_type => /\Aimage\/.*\Z/
  
  if Rails.env.development?
    has_attached_file :fb_image, FB_IMAGE_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :fb_image,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '1200x630>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "releases/fb_images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :fb_image, :content_type => /\Aimage\/.*\Z/
  
  if Rails.env.development?
    has_attached_file :slide_image, SLIDE_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :slide_image,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '1115x952>'},
    :storage => :s3,
    :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET'] },
    :url => ':s3_alias_url',
    :s3_host_alias => 'd9gj9tfjl21as.cloudfront.net', 
    :bucket => 'split-two',
    :path => "releases/slide_images/:id_partition/:style/:filename"
  end
  
  def self.search(search)
      where('LOWER(title) LIKE :search', search: "%#{search}%")
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :slide_image, :content_type => /\Aimage\/.*\Z/
  
  
end