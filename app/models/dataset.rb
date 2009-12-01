class Dataset < ActiveRecord::Base
  belongs_to :licence
  has_many :customers
  
  validates_presence_of :title, :short_desc, :long_desc, :metadata_description, :licence
  validates_format_of :shp_download, :wms, :wfs, :meta_download, :with => /^((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/, :allow_blank => true
  
end
