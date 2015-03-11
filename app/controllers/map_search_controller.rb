class MapSearchController < ApplicationController
  inject :search, :datasets_repository

  def index
    search_filters = MapSearch.new(search_params)
    if search_filters.valid?
      render json: search.query(search_filters), each_serializer: DatasetSerializer
    else
      render json: {error: 'query not valid'}
    end
  end

  def show
    render json: datasets_repository.find(params[:id])
  end

  private

  def search_params
    params.permit(:text_search, :sort_by, formats: [], data_categories: [], observation_types: [], geographical_ranges: [])
  end
end
