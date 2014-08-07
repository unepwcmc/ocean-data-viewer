class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :title, :wms_server, :wms_name, :wfs, :order_number,
      :has_legend, :format, :observation_type, :geographical_range,
      :creation_date, :url, :data_categories, :time_range_start,
      :time_range_end, :time_range, :data_provider, :shp_download,
      :factsheet_url, :arcgis_link, :styles, :view_params

  def url
    dataset_url object
  end

  def time_range
    [object.time_range_start, object.time_range_end].join('-')
  end

  def factsheet_url
    object.factsheet.url
  end
end
