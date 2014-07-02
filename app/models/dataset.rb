class Dataset < ActiveRecord::Base
  belongs_to :licence
  has_many :customers
  has_many :datasets_decisions
  has_many :decisions, through: :datasets_decisions
  has_and_belongs_to_many :data_categories

  include DatasetFixedFieldsValidation

  validates_presence_of :title, :short_desc, :long_desc, :metadata_description, :licence
  validates_format_of :wms_server, :wfs, :meta_download, :with => /\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z0-9]{1,5}(:[0-9]{1,5})?(\/.*)?\z/, :allow_blank => true

  before_save :strip_urls

  accepts_nested_attributes_for :data_categories

  has_attached_file :factsheet

  do_not_validate_attachment_file_type :html
  do_not_validate_attachment_file_type :xml
  do_not_validate_attachment_file_type :factsheet

  private

  def strip_urls
    [wms_name, wms_server].each {|s| s.strip!}
  end
end
