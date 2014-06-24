class ObservationType
  include FakeBasicModel

  def self.allowed_values
    [ 'empirical', 'modelled' ].freeze
  end
end
