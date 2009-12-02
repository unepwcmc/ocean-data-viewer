class Customer < ActiveRecord::Base
  belongs_to :licence
  belongs_to :dataset
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "must be a valid email address"
  validates_presence_of :title,:first_name, :last_name, :email, :institution, :intended_use, :licence, :dataset
  validates_confirmation_of :licence_agreed  
  
end
