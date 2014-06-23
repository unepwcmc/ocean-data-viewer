require 'active_support/concern'

module MockModel
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include ActiveModel::ForbiddenAttributesProtection
  end

  def initialize(attributes = {})
    assign_attributes(attributes)
    yield(self) if block_given?
  end

  def persisted?
    false
  end

  def assign_attributes(values, options = {})
    sanitize_for_mass_assignment(values).each do |k, v|
      send("#{k}=", v)
    end
  end
end
