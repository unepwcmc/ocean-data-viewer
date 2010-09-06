class DatasetsController < ApplicationController
  before_filter :get_stats
  # GET /datasets
  def index
    @datasets = Dataset.all
    @decisions = Decision.roots
  end

  # GET /datasets/1
  def show
    @dataset = Dataset.find(params[:id])
    @customer = Customer.new
  end
  
  def get_stats
    @dataset_count = Dataset.count
  end
end
