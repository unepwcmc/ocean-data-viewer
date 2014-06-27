class MapSearchController < ApplicationController
  inject :search

  def index
    search_filters = MapSearch.new(search_params)
    if search_filters.valid?
      render json: search.query(search_filters), each_serializer: DatasetSerializer
    else
      render json: {error: 'query not valid'}
    end
  end

  private

  def search_params
    params.permit(:sort_by, formats: [], data_categories: [], observation_types: [], geographical_ranges: [])
  end
end
