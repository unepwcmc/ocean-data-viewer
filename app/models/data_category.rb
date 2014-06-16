class DataCategory < ActiveRecord::Base
  has_and_belongs_to_many :datasets
end
