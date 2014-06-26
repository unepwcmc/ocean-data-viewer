class DatasetsController < ApplicationController
  inject :data_categories, :data_formats, :observation_types, :geographical_ranges
  helper_method :data_categories, :data_formats, :observation_types, :geographical_ranges

  # GET /datasets
  def index
    @search = MapSearch.new(sort_by: 'creation_date')
    @decisions = Decision.where(:parent_id => nil).order("order_number ASC")
  end

  # GET /datasets/1
  def show
    @dataset = DatasetPresenter.new(Dataset.find(params[:id]))
    @customer = Customer.new(params[:customer])
  end
end
