class Customer < ActiveRecord::Base
  belongs_to :dataset
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "must be a valid email address"
  validates_presence_of :title,:first_name, :last_name, :email, :institution, :intended_use, :licence, :dataset
  validates_inclusion_of :licence_agreed, :in => [true], :message => 'You must agree to the data licence'
  validates_inclusion_of :understand_collaboration, :in => [true], :message => 'You must agree to explore collaboration with UNEP-WCMC in further analysis'
  validates_inclusion_of :non_commercial, :in => [true], :message => 'You must agree to not use the dataset for commercial purposes'
  
end
