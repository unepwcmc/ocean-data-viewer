class MapSearchService
  takes :datasets_repository

  def query(search)
    query_result = datasets_repository.order(search.sort_by)
    query_result = query_result.where("format IN (?)", search.formats) if search.formats
    query_result = query_result.where("observation_type IN (?)", search.observation_types) if search.observation_types
    query_result
  end
end
