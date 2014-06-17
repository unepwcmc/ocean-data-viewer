class GeographicalRange
  include FakeBasicModel

  def self.allowed_values
    [ 'global', 'regional' ].freeze
  end
end
