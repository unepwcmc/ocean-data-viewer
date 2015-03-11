class MapSearch
  include MockModel

  SORT_BY_OPTIONS = ['title', 'creation_date DESC'].freeze

  attr_accessor :text_search, :sort_by, :formats, :data_categories,
    :observation_types, :geographical_ranges

  validates :sort_by, inclusion: { in: SORT_BY_OPTIONS }
  validate :validate_geographical_ranges

  def advanced_search?
    advanced_filters = [:observation_types, :geographical_ranges].select do |field|
      self.send(field)
    end
    !advanced_filters.empty?
  end

  {
    geographical_ranges: GeographicalRange
  }.each do |attr_name, related_class|
    define_method "validate_#{attr_name}" do
      return if self.send(attr_name).nil?
      if self.send(attr_name).is_a?(Array) and self.send(attr_name).detect{|d| !related_class.allowed_values.include?(d)}
        errors.add(attr_name, :invalid)
      end
    end
  end
end
