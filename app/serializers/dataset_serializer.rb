class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :title, :wms_server, :wms_name, :wfs, :order_number,
      :has_legend, :data_formats, :observation_types, :geographical_range,
      :creation_date, :url, :data_categories, :time_range_start,
      :time_range_end, :time_range, :data_provider, :shp_download,
      :factsheet_url, :arcgis_link, :styles, :view_params, :recently_updated,
      :recently_created, :version

  def url
    dataset_path object
  end

  def time_range
    return object.time_range_start if object.time_range_start && !object.time_range_end
    return object.time_range_end if object.time_range_end && !object.time_range_start
    [object.time_range_start, object.time_range_end].join('-')
  end

  def factsheet_url
    object.factsheet.url
  end

  def recently_updated
    object.recently_updated?
  end

  def recently_created
    object.recently_created?
  end
end
