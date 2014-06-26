class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :title, :wms_server, :wms_name, :wfs, :order_number,
      :has_legend, :format, :observation_type, :geographical_range,
      :creation_date, :url, :categories_names, :time_range_start,
      :time_range_end, :time_range, :data_provider, :shp_download,
      :factsheet_url, :arcgis_link

  def url
    dataset_url object
  end

  def creation_date
    object.creation_date.strftime("%Y") if object.creation_date
  end

  def categories_names
    object.data_categories.map(&:name).join(', ')
  end

  def time_range
    [object.time_range_start, object.time_range_end].join('-')
  end

  def factsheet_url
    object.factsheet.url
  end
end
