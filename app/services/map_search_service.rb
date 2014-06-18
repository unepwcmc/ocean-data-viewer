class MapSearchService
  takes :datasets_repository

  def query(search)
    query_result = datasets_repository.order_by(search.sort_by)
    #query_result = query_result.where("format in (?)", search.format) if search.format
    #query_result = query_result.where("observation_type in (?)", search.observation_types) if search.observation_types
  end
end
