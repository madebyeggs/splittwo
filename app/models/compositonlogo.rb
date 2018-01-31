class Compositonlogo < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :logo, COMPOSITON_LOGO_PAPERCLIP_STORAGE_OPTS
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
    :path => "compositonlogos/images/:id_partition/:style/:filename"
  end
end
