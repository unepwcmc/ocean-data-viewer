class DatasetPresenter < SimpleDelegator
  def creation_date
    "<span>#{dataset.creation_date.strftime("%Y")}</span>".html_safe if dataset.creation_date
  end

  def data_categories
    if dataset.data_categories.present?
      "<span class='prepend-pipe'>#{dataset.data_categories.map(&:name).join(', ')}</span><br/>".html_safe
    end
  end

  def format
    if %w(polygon point raster).include?(dataset.format)
      "<span class='prepend-symbol prepend-pipe #{dataset.format}'>#{dataset.format.to_s.capitalize}</span><br/>".html_safe
    elsif dataset.format == 'point & polygon'
      "<span class='prepend-symbol prepend-pipe point'>Point + </span><span class='prepend-symbol polygon'>Polygon</span><br/>".html_safe
    end
  end

  def time_range
    if dataset.time_range_start && dataset.time_range_end
      "<span>Time range: #{dataset.time_range_start} - #{dataset.time_range_end}</span>".html_safe
    end
  end

  def observation_type
    "<span class='prepend-pipe'>#{dataset.observation_type.capitalize}</span>".html_safe if dataset.observation_type
  end

  def data_provider
    "<span>Data provider: #{dataset.data_provider}</span>".html_safe if dataset.data_provider.present?
  end

  def dataset
    __getobj__
  end
end
