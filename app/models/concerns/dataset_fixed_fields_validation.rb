require 'active_support/concern'

module DatasetFixedFieldsValidation
  extend ActiveSupport::Concern

  included do
    validates :format, allow_nil: true, inclusion: { in: DataFormat.allowed_values }
    validates :observation_type, allow_nil: true, inclusion: { in: ObservationType.allowed_values }
    validates :geographical_range, allow_nil: true, inclusion: { in: GeographicalRange.allowed_values }
  end
end
