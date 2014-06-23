class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :title, :wms_server, :wms_name, :wfs, :order_number, :has_legend, :format, :observation_type, :geographical_range, :creation_date, :url

  def url
    dataset_url object
  end
end
