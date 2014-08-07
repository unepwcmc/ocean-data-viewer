class ObservationType
  include FakeBasicModel

  def self.allowed_values
    [ 'empirical', 'modelled', 'metric', 'classification' ].freeze
  end
end
