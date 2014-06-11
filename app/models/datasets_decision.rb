class DatasetsDecision < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :decision
  belongs_to :category
  
  validates_presence_of :dataset, :decision
end
