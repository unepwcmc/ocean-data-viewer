class GeographicalRange
  include FakeBasicModel

  def self.allowed_values
    [ 'global', 'other' ].freeze
  end
end
