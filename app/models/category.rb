class Category < ActiveRecord::Base
  has_many :datasets_decisions
  belongs_to :decision
  
  validates_presence_of :name, :short_desc
end
