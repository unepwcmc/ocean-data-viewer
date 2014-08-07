class Injector
  takes :request

  include MemoizeServices

  service (:dataset) { datasets_repository.find(id('dataset')) }
  service (:datasets_repository) { Dataset }

  service (:data_categories) { data_categories_repository.all }
  service (:data_categories_repository) { DataCategoriesRepository.new }

  service (:data_formats) { DataFormat.all }

  service (:observation_types) { ObservationType.all }

  service (:geographical_ranges) { GeographicalRange.all }

  service (:search) { MapSearchService.new(datasets_repository) }

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
