class Dataset < ActiveRecord::Base
  has_many :customers
  has_many :datasets_decisions, dependent: :destroy
  has_many :decisions, through: :datasets_decisions
  has_and_belongs_to_many :data_categories
  has_and_belongs_to_many :observation_types
  has_and_belongs_to_many :data_formats

  include DatasetFixedFieldsValidation
  include PgSearch

  pg_search_scope :search_by_text, :using => { :tsearch => {:prefix => true} },
    :against => [:title, :tags]

  validates_presence_of :title, :short_desc, :long_desc, :metadata_description
  validates_format_of :wms_server, :wfs, :meta_download, :with => /\A((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z0-9]{1,5}(:[0-9]{1,5})?(\/.*)?\z/, :allow_blank => true

  before_save :strip_urls

  accepts_nested_attributes_for :data_categories
  accepts_nested_attributes_for :observation_types
  accepts_nested_attributes_for :data_formats

  has_attached_file :factsheet
  do_not_validate_attachment_file_type :factsheet

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "400x400>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_image
  before_save -> { image.clear if delete_image == '1' }

  def tags_array
    tags.join(',')
  end

  def tags_array=(params)
    self.tags = params.gsub(' ', '').split(',')
    self.save
  end

  def recently_updated?
    self.updated_at > 30.days.ago && self.updated_at != self.created_at
  end

  def recently_created?
    self.created_at > 30.days.ago
  end

  private

  def strip_urls
    [wms_name, wms_server].each {|s| s.try(:strip!)}
  end
end
