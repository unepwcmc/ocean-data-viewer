require 'active_support/concern'

module DatasetFixedFieldsValidation
  extend ActiveSupport::Concern

  included do
    validates :geographical_range, allow_nil: true, inclusion: { in: GeographicalRange.allowed_values }
  end
end
