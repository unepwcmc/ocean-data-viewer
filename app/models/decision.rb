class Decision < ActiveRecord::Base
  has_many :datasets_decisions, dependent: :destroy
  has_many :datasets, :through => :datasets_decisions
  has_many :categories
  has_many :children, :class_name => 'Decision', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Decision'

  validates_presence_of :name, :short_name

  scope :roots, -> { where(parent_id: nil) }
end
