class DatasetPresenter < SimpleDelegator
  def creation_date
    "<span>#{dataset.creation_date ? dataset.creation_date.strftime("%Y") : ''}</span>".html_safe
  end

  def data_categories
    if dataset.data_categories.present?
      "<span class='categories'>#{dataset.data_categories.map(&:name).join(', ')}</span>".html_safe
    end
  end

  def dataset
    __getobj__
  end
end
