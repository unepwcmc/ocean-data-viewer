class DataFormat
  include FakeBasicModel

  def self.allowed_values
   [ 'point', 'polygon', 'point & polygon', 'raster' ].freeze
  end
end
