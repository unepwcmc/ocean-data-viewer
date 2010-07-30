class Dataset < ActiveRecord::Base
  belongs_to :licence
  has_many :customers
  
  validates_presence_of :title, :short_desc, :long_desc, :metadata_description, :licence
  validates_format_of :wms, :wfs, :meta_download, :with => /^((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/, :allow_blank => true
  
  has_attached_file :html,
                     :storage => :s3,
                     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",  
                     :bucket => "marine-portal",
                     :path => "resources/:class/:attachment/:id/:style_:basename.:extension",
                     :url => ":s3_domain_url"
                     
  has_attached_file :xml,
                     :storage => :s3,
                     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",  
                     :bucket => "marine-portal",
                     :path => "resources/:class/:attachment/:id/:style_:basename.:extension",
                     :url => ":s3_domain_url"
end
