class Dataset < ActiveRecord::Base
  has_many :customers
  has_many :datasets_decisions
  has_many :decisions, through: :datasets_decisions
  has_and_belongs_to_many :data_categories
  has_and_belongs_to_many :observation_types
  has_and_belongs_to_many :data_formats

  include DatasetFixedFieldsValidation

  validates_presence_of :title, :short_desc, :long_desc, :metadata_description
  validates_format_of :wms_server, :wfs, :meta_download, :with => /\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z0-9]{1,5}(:[0-9]{1,5})?(\/.*)?\z/, :allow_blank => true

  before_save :strip_urls

  accepts_nested_attributes_for :data_categories
  accepts_nested_attributes_for :observation_types
  accepts_nested_attributes_for :data_formats

  has_attached_file :factsheet
  do_not_validate_attachment_file_type :factsheet

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_image
  before_save -> { image.clear if delete_image == '1' }

  private

  def strip_urls
    [wms_name, wms_server].each {|s| s.strip!}
  end
end
