class MapSearchService
  takes :datasets_repository

  def query(search)
    query_result = datasets_repository.order(search.sort_by)
    query_result = query_result.search_by_text(search.text_search) if search.text_search.present?
    query_result = query_result.where("geographical_range IN (?)", search.geographical_ranges) if search.geographical_ranges
    query_result = query_result.joins(:data_formats).where("data_formats.id IN (?)", search.formats.map(&:to_i)) if search.formats
    query_result = query_result.joins(:observation_types).where("observation_types.id IN (?)", search.observation_types.map(&:to_i)) if search.observation_types
    query_result = query_result.joins(:data_categories).where("data_categories.id IN (?)", search.data_categories.map(&:to_i)) if search.data_categories
    query_result.uniq
  end
end
