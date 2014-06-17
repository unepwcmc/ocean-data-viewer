class ObservationType
  include FakeBasicModel

  def self.allowed_values
    [ 'empirical', 'modeled' ].freeze
  end
end
