class Announcement < ActiveRecord::Base
  
  belongs_to :slide
  before_save { |announcement|
    if announcement.soundcloud_changed? then
      input_string = announcement.soundcloud.gsub(/\s+/, "").to_s
      str1_markerstring = "playlists/"
      str2_markerstring = "&color"
      input_string_chop = input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
      announcement.soundcloud = input_string_chop
    end
  }
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  include Filterable
  
  require 'csv'
  
  before_save :upcase_fields
  before_validation :make_first, on: :create
  
  def make_first
    self.row_order_position ||= :first
  end
  
  def upcase_fields
    unless self.slide_title.to_s.strip.empty?
      self.slide_title.upcase!
    end
    unless self.slide_title2.to_s.strip.empty?
      self.slide_title2.upcase!
    end
    unless self.artist_name.to_s.strip.empty?
      self.artist_name.upcase!
    end
    unless self.track_name.to_s.strip.empty?
      self.track_name.upcase!
    end
  end
  
  def slug_candidates
    if self.slug
      "#{slide_title}-#{slide_title2}-#{id}"
    else
      "#{slide_title}-#{slide_title2}"
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      announcement = Announcement.find_or_initialize_by(name: row["name"])
      announcement.assign_attributes(row.to_hash)
      announcement.save!
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
    :path => "announcements/images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
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
    :path => "announcements/slide_images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :slide_image, :content_type => /\Aimage\/.*\Z/
  
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
    :path => "announcements/slide_images/:id_partition/:style/:filename"
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
    :path => "announcements/fb_images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :fb_image, :content_type => /\Aimage\/.*\Z/
end
