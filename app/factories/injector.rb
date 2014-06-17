class Injector
  attr_accessor :request

  def initialize(request)
    self.request = request
  end

  include MemoizeServices

  service (:dataset) { Dataset.find(id('dataset')) }

  service (:data_categories) { data_categories_repository.all }
  service (:data_categories_repository) { DataCategoriesRepository.new }

  service (:data_formats) { DataFormat.all }

  service (:observation_types) { ObservationType.all }

  service (:geographical_ranges) { GeographicalRange.all }

  service (:licences) { Licence.all.order("title ASC") }

  private

  def params
    request.params
  end

  def id(model)
    resource = params[:controller].split('/').last
    if resource == model.pluralize
      params[:id] || params["#{model}_id"]
    else
      params["#{model}_id"]
    end
  end
end
