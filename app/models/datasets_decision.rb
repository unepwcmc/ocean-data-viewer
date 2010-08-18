class DatasetsDecision < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :decision
  belongs_to :categories
  
  validates_presence_of :dataset, :decision
end
