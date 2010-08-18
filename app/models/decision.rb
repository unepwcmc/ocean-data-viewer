class Decision < ActiveRecord::Base
  has_many :datasets_decisions
  has_many :datasets, :through => :datasets_decisions
  has_many :categories
  
  validates_presence_of :name, :short_name
end
