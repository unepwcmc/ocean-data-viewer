class DatasetsController < ApplicationController
  # GET /datasets
  def index
    @decisions = Decision.where(:parent_id => nil).order("order_number ASC")
  end

  # GET /datasets/1
  def show
    @dataset = DatasetPresenter.new(Dataset.find(params[:id]))
    @customer = Customer.new(params[:customer])
  end
end
