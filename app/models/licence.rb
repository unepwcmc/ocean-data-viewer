class Licence < ActiveRecord::Base
  has_many :datasets
  has_many :customers

  validates_presence_of :title, :body, :short_desc
end
