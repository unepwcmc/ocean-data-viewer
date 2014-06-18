class MapSearchController < ApplicationController
  inject :search

  def create
    search_filters = MapSearch.new(search_params)
    if search_filters.valid?
      search.query(search_filters)
    end
  end

  private

  def search_params
    params.require(:search).permit(:sort_by, :formats, :data_categories, :observation_types, :geographical_ranges)
  end
end
