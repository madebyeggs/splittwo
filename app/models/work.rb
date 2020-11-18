class Work < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  include Filterable
  
  require 'csv'
  
  before_save :upcase_fields
  
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
    if self.brand_name    
      [
        :brand_name, 
        [:brand_name, :campaign_title],
      ]
    else
      :brand_name
    end
  end
  
  def remake_slug
    self.update_attribute(:slug, nil)
    self.save!
  end
  
  def should_generate_new_friendly_id?
    new_record? || self.slug.nil?
  end
  
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
    has_attached_file :hero, HERO_PAPERCLIP_STORAGE_OPTS
  else
    has_attached_file :hero,
    :convert_options => { :all => '-quality 92' }, 
    styles: {main: '564x235>'},
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
  
  def self.search(search)
    if search.to_s.include? "slide"
      where('slideshow = TRUE') # Needs to be - where('slideshow = "t"') in development and - where('slideshow = TRUE') in production
    elsif search.to_s.include? "news"
      where('newsletter = TRUE')
    elsif search
      where('LOWER(brand_name) LIKE :search OR LOWER(campaign_title) LIKE :search 
      OR LOWER(agency) LIKE :search OR LOWER(vimeo) LIKE :search OR LOWER(platform) LIKE :search', search: "%#{search}%")
    else
      all
    end
  end
  
end