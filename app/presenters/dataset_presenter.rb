class DatasetPresenter < SimpleDelegator
  def creation_date
    "<span>#{dataset.creation_date.strftime("%Y")}</span>".html_safe if dataset.creation_date
  end

  def data_categories
    if dataset.data_categories.present?
      "<span class='prepend-pipe'>#{dataset.data_categories.map(&:name).join(', ')}</span>".html_safe
    end
  end

  def format
    if dataset.format
      "<br/><span>#{dataset.format.to_s.capitalize}</span>".html_safe
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
    "<br/><span>Data provider: #{dataset.data_provider}</span>".html_safe if dataset.data_provider
  end

  def dataset
    __getobj__
  end
end
