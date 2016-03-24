class Work < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :brand_name, use: :slugged
  
  require 'csv'
  
  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      work = Work.find_or_initialize_by(campaign_title: row["campaign_title"])
      work.assign_attributes(row.to_hash)
      work.save!
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
    :path => "works/images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
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
    :path => "works/fb_images/:id_partition/:style/:filename"
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
    :path => "works/slide_images/:id_partition/:style/:filename"
  end
  
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :slide_image, :content_type => /\Aimage\/.*\Z/
  
end